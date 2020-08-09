import Foundation

public struct BernoulliDistribution: DiscreteRandomVariable {
    public init(probability: Double) {
        assert(SwiftB.isValid(probability: probability))
        
        self.probability = probability
    }
    
    public let bounds = 0...1
    
    public func value() -> Int {
        let p = SwiftB.standardUniform() // TODO: Check & compare with GSL implementation
        if p <= self.probability {
            return 1
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
