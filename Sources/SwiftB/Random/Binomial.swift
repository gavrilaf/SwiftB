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
        return generateBinomialNaive(trials: trials, probability: probability)
    }
    
    public let trials: Int
    public let probability: Double
}


func generateBinomialNaive(trials: Int, probability: Double) -> Int {
    let b = BernoulliDistribution(probability: probability)
    
    var sum = 0
    for _ in 0...trials-1 {
        sum += b.value()
    }
    
    return sum
}
