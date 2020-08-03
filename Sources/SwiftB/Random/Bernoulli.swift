import Foundation

public struct BernoulliDistribution: DiscreteRandomVariable {
    public init(probability: Double) {
        assert(SwiftB.isValid(probability: probability))
        
        self.probability = probability
    }
    
    public func value() -> UInt8 {
        let p = SwiftB.standardUniformGenerator.value()
        if p <= self.probablity {
            return 1
        }
        
        return 0
    }
    
    private let probability: Double
}
