import Foundation

/**
 Standard uniform distribution (uniform distibution on [0, 1]
 */
open class StandardUniformVariable: ContinuousRandomVariable {
    public final var range: Range<Double> {
        return Range(uncheckedBounds: (0, 1))
    }
    
    public func value() -> Double {
        fatalError("not implemented")
    }
}

// MARK:- implementation

final class SystemStandardUniformVariable: StandardUniformVariable {
    public override func value() -> Double {
        return drand48()
    }
}
