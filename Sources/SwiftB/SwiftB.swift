import Foundation

public struct SwiftB {
        
    public static var standardUniformGenerator: StandardUniformVariable = SystemStandardUniformVariable()
}


extension SwiftB {
    
    public static func isEven<T: BinaryInteger>(_ n: T) -> Bool {
        return n.isMultiple(of: 2)
    }
    
    public static func isOdd<T: BinaryInteger>(_ n: T) -> Bool {
        return !isEven(n)
    }
}

extension SwiftB {
    
    public static func isValid(probability: Double) -> Bool {
        return probability >= 0 && probability <= 1
    }
}

// MARK:- Generators

extension SwiftB {
    
    public static func generateDiscrete(variable: DiscreteRandomVariable, count: Int) -> [Int] {
        return (0..<count).map { (_) in
            variable.value()
        }
    }
}
