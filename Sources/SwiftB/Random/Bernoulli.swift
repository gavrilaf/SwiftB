import Foundation

public struct BernoulliDistribution: DiscreteRandomVariable {
    public init(probability: Double) {
        assert(SwiftB.isValid(probability: probability))
        
        self.probability = probability
    }
    
    public func value() -> Int {
        let p = SwiftB.standardUniformGenerator.value()
        if p <= self.probability {
            return 1
        }
        
        return 0
    }
    
    private let probability: Double
}
