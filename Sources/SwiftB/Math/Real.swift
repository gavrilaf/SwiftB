import Foundation

/**
 FloatingPoint extension that supports different math operations
 */
public protocol Real: FloatingPoint, ExpressibleByFloatLiteral {
    func toPower(_ exponent: Self) -> Self
}


// MARK:- Double

extension Double: Real {
    public func toPower(_ exponent: Double) -> Double {
        return pow(self, exponent)
    }
}


// MARK:- Double

extension Float: Real {
    public func toPower(_ exponent: Float) -> Float {
        return pow(self, exponent)
    }
}
