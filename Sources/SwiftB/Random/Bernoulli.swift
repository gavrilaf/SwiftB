import Foundation

public struct BernoulliDistribution: DiscreteRandomVariable {
    public init(probability: Double) {
        assert(SwiftB.isValid(probability: probability))
        
        self.probability = probability
    }
    
    public let bounds = 0...1
    
    public func value() -> Int {
        let p = SwiftB.standardUniform() 
        
        if p < self.probability {
            return 1
        }
        
        return 0
    }
    
    public func pdf(_ v: Int) -> Double {
        if v == 1 {
            return probability
        } else if v == 0 {
            return 1 - probability
        }
        
        return 0
    }
    
    public var expectation: Double {
        return probability
    }
    
    public var variance: Double {
        return probability * (1 - probability)
    }
    
    public let probability: Double
}
