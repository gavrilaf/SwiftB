import Foundation

public struct SwiftB {
    
    public static var standardUniformGenerator: StandardUniformVariable = SystemStandardUniformVariable(bounds: standardBounds)
    
    static let standardBounds = ClosedRange(uncheckedBounds: (lower: 0.0, upper:1.0))
    static let delta = 0.000001
}

extension SwiftB {
    
    public typealias ComparableSignedNumeric = Comparable & SignedNumeric
    
    public static func closeEqual<T: ComparableSignedNumeric>(_ lhs: T, _ rhs: T, delta: T) -> Bool {
        let s = abs(rhs - lhs)
        return s <= delta
    }
    
    public static func closeEqual<S: Sequence>(_ lhs: S, _ rhs: S, delta: S.Element) -> Bool where S.Element: ComparableSignedNumeric {
        var li = lhs.makeIterator()
        var ri = rhs.makeIterator()
        
        var le = li.next()
        var re = ri.next()
        
        while let _le = le, let _re = re {
            if !closeEqual(_le, _re, delta: delta) {
                return false
            }
            
            le = li.next()
            re = ri.next()
        }
        
        return le == nil && re == nil
    }
}

extension SwiftB {
    
    public static func isValid(probability: Double) -> Bool {
        return probability >= 0 && probability <= 1
    }
}

// MARK:- Generators

extension SwiftB {
    
    public static func generateDiscrete<V: DiscreteRandomVariable>(variable: V, count: Int) -> [Int] {
        return (0..<count).map { (_) in
            variable.value()
        }
    }
    
    public static func generateContinuous<V: ContinuousRandomVariable>(variable: V, count: Int) -> [Double] {
        return (0..<count).map { (_) in
            variable.value()
        }
    }
}
