import Foundation

/**
 Standard uniform distribution (uniform distibution on [0, 1]
 */
open class StandardUniformVariable: ContinuousRandomVariable {
    init(bounds: ClosedRange<Double>) {
        self.bounds = bounds
    }
    
    public let bounds: ClosedRange<Double>
    
    public func value() -> Double {
        fatalError("not implemented")
    }
    
    public var expectation: Double {
        return (bounds.upperBound - bounds.lowerBound) / 2
    }
    
    public var variance: Double {
        return Double.pow((bounds.upperBound - bounds.lowerBound), 2) / 12
    }
}

// MARK:- implementation

final class SystemStandardUniformVariable: StandardUniformVariable {
    public override func value() -> Double {
        return Double.random(in: bounds)
    }
}
