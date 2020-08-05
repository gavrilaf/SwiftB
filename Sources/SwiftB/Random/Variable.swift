import Foundation

public protocol RandomVariable {
    var expectation: Double { get }
    
    var variance: Double { get }
}

/**
 Base protocol for the continuous random variable
 */
public protocol ContinuousRandomVariable {
    var range: Range<Double> { get }
    
    func value() -> Double
}


/**
 Base protocol for the discrete random variable
 */
public protocol DiscreteRandomVariable {
    func value() -> Int
}
