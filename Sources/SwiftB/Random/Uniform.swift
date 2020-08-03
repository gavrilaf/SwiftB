import Foundation

/**
 Standard uniform distribution (uniform distibution on [0, 1]
 */
open class StandardUniformVariable: ContinuousRandomVariable {
    final var range: Range<Double> {
        return Range(uncheckedBounds: (0, 1))
    }
    
    func value() -> Double {
        fatalError("not implemented")
    }
}

// MARK:- implementation

final class SystemStandardUniformVariable: StandardUniformVariable {
    func value() -> Double {
        return drand48()
    }
}
