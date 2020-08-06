import Foundation

public struct SwiftB {
    
    public static var standardUniformGenerator: UniformDistribution = SystemUniformDistribution(bounds: standardBounds)
    
    static let standardBounds = ClosedRange(uncheckedBounds: (lower: 0.0, upper:1.0))
    static let delta = 0.000001
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
