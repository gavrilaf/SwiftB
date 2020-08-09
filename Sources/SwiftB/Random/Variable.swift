import Foundation

public protocol RandomVariable {
    associatedtype Value: SignedNumeric & Comparable
    
    var bounds: ClosedRange<Value> { get }
    
    func value() -> Value
    
    var expectation: Double { get }
    var variance: Double { get }
}

/**
 Base protocol for the continuous random variable
 */
public protocol ContinuousRandomVariable: RandomVariable {
    var bounds: ClosedRange<Double> { get }
    
    func value() -> Double
}


/**
 Base protocol for the discrete random variable
 */
public protocol DiscreteRandomVariable: RandomVariable {
    var bounds: ClosedRange<Int> { get }
    
    func pdf(_ v: Int) -> Double
    
    func value() -> Int
}
