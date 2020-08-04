import Foundation

public struct BernoulliDistribution: DiscreteRandomVariable {
    public init(probability: Double) {
        assert(SwiftB.isValid(probability: probability))
        
        self.probability = probability
    }
    
    public func value() -> Int {
        let p = SwiftB.standardUniformGenerator.value()
        if p <= self.probability - SwiftB.delta {
            return 1
        }
        
        return 0
    }
    
    private let probability: Double
}

extension BernoulliDistribution {
    public func expectedFrequencies(count: Int) -> [Int] {
        let d = (Double(count)*probability, Double(count) - Double(count)*probability)
        
        if probability >= 0.5 {
            return [min(Int(d.0), Int(d.1)), max(Int(d.0), Int(d.1))]
        }
        
        return [max(Int(d.0), Int(d.1)), min(Int(d.0), Int(d.1))]
    }
}
