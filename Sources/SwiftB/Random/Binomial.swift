import Foundation


public struct BinomialDistribution: DiscreteRandomVariable {
    public init(trials: Int, propability: Double) {
        assert(SwiftB.isValid(probability: propability))
        
        self.trials = trials
        self.probability = propability
    }
    
    public var bounds: ClosedRange<Int> { 0...trials }
    
    public var expectation: Double {
        return Double(trials) * probability
    }
    
    public var variance: Double {
        return Double(trials) * probability * (1 - probability)
    }
    
    public func value() -> Int {
        return BinomialDistribution.generate(trials: trials, probability: probability)
    }
    
    public func pdf(_ v: Int) -> Double {
        return 0
    }
    
    public let trials: Int
    public let probability: Double
}

// MARK:- private

extension BinomialDistribution {
    
    private static let BINV_CUTOFF = 110
    private static let SMALL_MEAN = 30.0
    private static let FAR_FROM_MEAN = 20
    
    private static func generate(trials: Int, probability: Double) -> Int {
        guard trials >= 0 else { return 0 }
        
        let p: Double
        let flipped: Bool
        if probability > 0.5 {
            p = 1 - probability
            flipped = true
        } else {
            p = probability
            flipped = false
        }
        
        let np: Double = Double(trials) * p
        
        let r: Int
        if np < SMALL_MEAN {
            r = inverseCDF(p: p, n: trials)
        } else {
            r = btpe(p: p, n: trials, np: np)
        }
        
        return flipped ? (trials - r) : r
    }
    
    private static func inverseCDF(p: Double, n: Int) -> Int {
        let q: Double = 1 - p
        let s: Double = p / q
        
        let f0: Double = pow(q, Double(n))
        
        while true {
            var f: Double = f0
            var u: Double = SwiftB.standardUniform()
            
            for ix in 0...BINV_CUTOFF {
                if u < f {
                    return ix
                }
                
                u -= f
                
                let s1: Double = s * Double(n - ix)
                f *= s1 / Double(ix + 1)
            }
        }
    }
    
    private static func btpe(p: Double, n: Int, np: Double) -> Int {
        let q: Double = 1 - p
        let s: Double = p / q
        
        let ffm: Double = np + p
        
        let m: Int = Int(ffm)
        let fm: Double = Double(m)
        
        let xm: Double = fm + 0.5
        let npq: Double = np * q
        
        /**
         * Compute cumulative area of tri, para, exp tails
         * p1: radius of triangle region; since height=1, also: area of region
         * p2: p1 + area of parallelogram region
         * p3: p2 + area of left tail
         * p4: p3 + area of right tail
         * pi/p4: probability of i'th area (i=1,2,3,4)
         */
        
        let p1: Double = floor(2.195 * sqrt(npq) - 4.6 * q) + 0.5
        
        /* xl, xr: left and right edges of triangle */
        let xl: Double = xm - p1
        let xr: Double = xm + p1
        
        /**
         * Parameter of exponential tails
         * Left tail:  t(x) = c*exp(-lambda_l*[xl - (x+0.5)])
         * Right tail: t(x) = c*exp(-lambda_r*[(x+0.5) - xr])
         */
        
        let c: Double = 0.134 + 20.5 / (15.3 + fm)
        let p2: Double = p1 * (1.0 + c + c)
        
        let al: Double = (ffm - xl) / (ffm - xl * p)
        let lambda_l: Double = al * (1.0 + 0.5 * al)
        let ar: Double = (xr - ffm) / (xr * q)
        let lambda_r: Double = ar * (1.0 + 0.5 * ar)
        let p3: Double = p2 + c / lambda_l
        let p4: Double = p3 + c / lambda_r
        
        while true {
            var ix: Int // result
            
            var vv: Double
            var accept: Double
            
            /* generate random variates, u specifies which region: Tri, Par, Tail */
            let u = SwiftB.standardUniform() * p4
            var v = SwiftB.standardUniform()
            
            if u <= p1 {
                /* Triangular region */
                return Int(xm - p1 * v + u)
            }
            
            if u <= p2 {
                /* Parallelogram region */
                let x = xl + (u - p1) / c
                v = v * c + 1.0 - abs(x - xm) / p1
                
                if v > 1.0 || v <= 0.0 {
                    continue
                }
                
                ix = Int(x)
            } else if u <= p3 {
                /* Left tail */
                ix = (Int)(xl + log(v) / lambda_l)
                
                if ix < 0 {
                    continue
                }
                
                v *= (u - p2) * lambda_l
            } else {
                /* Right tail */
                ix = (Int)(xr - log(v) / lambda_r)
                
                if ix > n {
                    continue
                }
                
                v *= (u - p3) * lambda_r
            }
            
            // SQUEEZE METHOD
            
            let k: Int = abs(ix - m)
            
            if k <= FAR_FROM_MEAN {
                /*
                 * If ix near m (ie, |ix-m|<FAR_FROM_MEAN), then do
                 * explicit evaluation using recursion relation for f(x)
                 */
                let g: Double = Double(n + 1) * s
                var f = 1.0
                
                vv = v
                
                if m < ix {
                    for i in (m + 1)...ix {
                        f *= g / Double(i) - s
                    }
                } else if m > ix {
                    for i in (ix + 1)...m {
                        f /= g / Double(i) - s
                    }
                }
                
                accept = f
            } else {
                /* If ix is far from the mean m: k=ABS(ix-m) large */
                vv = log(v)
                
                if Double(k) < npq / 2 - 1 {
                    /*
                     * "Squeeze" using upper and lower bounds on log(f(x))
                     * The squeeze condition was derived under the condition k < npq/2-1
                     */
                    
                    let amaxp: Double = _amaxp(k: k, npq: npq)
                    let ynorm: Double = -(pow(Double(k), 2) / (2.0 * npq))
                    
                    if vv < ynorm - amaxp {
                        return ix
                    }
                    
                    if vv > ynorm + amaxp {
                        continue
                    }
                }
                
                /* Now, again: do the test log(v) vs. log f(x)/f(M) */
                accept = _stirlingAccept(n: n, ix: ix, fm: fm, m: m, p: p, q: q, xm: xm)
            }
            
            if vv <= accept {
                return ix
            } else {
                continue
            }
        }
    }
    
    
    private static func _amaxp(k: Int, npq: Double) -> Double {
        let dk: Double = Double(k)
        
        let x1 = dk / 3.0 + 0.625
        let x2: Double = dk * x1 + (1.0 / 6.0)
        
        return dk / npq * (x2 / npq + 0.5)
    }
    
    private static func _stirlingAccept(n: Int, ix: Int, fm: Double, m: Int, p: Double, q: Double, xm: Double) -> Double {
        let x1: Double = Double(ix) + 1.0
        let w1: Double = Double(n - ix) + 1.0
        let f1: Double = fm + 1.0
        let z1: Double = Double(n) + 1.0 - fm
        
        /**
         * accept = xm * log (f1 / x1) + (n - m + 0.5) * log (z1 / w1)
         *   + (ix - m) * log (w1 * p / (x1 * q))
         *   + Stirling (f1) + Stirling (z1) - Stirling (x1) - Stirling (w1);
         */
        
        let r11 = Double(n - m) + 0.5
        let r12 = r11 * log(z1 / w1)
        let r13 = xm * log(f1 / x1) + r12 // final row
        
        let r21 = Double(ix - m)
        let r22 = r21 * log(w1 * p / (x1 * q)) // final row
        
        let r31 = _stirling(f1) + _stirling(z1) - _stirling(x1) - _stirling(w1)
        
        return r13 + r22 + r31
    }
    
    private static func _stirling(_ x: Double) -> Double {
        let y: Double = x * x
        
        let r1: Double = 99.0 - 140.0 / y
        let r2: Double = 132.0 - r1 / y
        let r3: Double = 462.0 - r2 / y
        let r4: Double = 13860.0 - r3 / y
        
        return r4 / x / 166320.0
    }
}
