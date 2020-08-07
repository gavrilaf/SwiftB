import Foundation

public struct SwiftB {
    
    public static var standardUniformGenerator: UniformDistribution = SystemUniformDistribution(bounds: standardBounds)
    
    public static let standardBounds = ClosedRange(uncheckedBounds: (lower: 0.0, upper:1.0))
}

extension SwiftB {
    
    public static func isValid(probability: Double) -> Bool {
        return probability >= 0 && probability <= 1
    }
}

// MARK:- Generators

extension SwiftB {
    
    public static func generateDiscrete<V: DiscreteRandomVariable>(variable: V, count: Int) -> [Int] {
        return Array<Int>(unsafeUninitializedCapacity: count) { (buf, outCount) in
            for i in 0..<count {
                buf[i] = variable.value()
            }
            outCount = count
        }
    }
    
    public static func generateContinuous<V: ContinuousRandomVariable>(variable: V, count: Int) -> [Double] {
        return Array<Double>(unsafeUninitializedCapacity: count) { (buf, outCount) in
            for i in 0..<count {
                buf[i] = variable.value()
            }
            outCount = count
        }
    }
}
