import XCTest
@testable import SwiftB

final class BernoulliDistibutionTests: XCTestCase {
    
    func testExpectedFrequencies() {
        XCTAssertEqual([50, 50], BernoulliDistribution(probability: 0.5).expectedFrequencies(count: 100))
        XCTAssertEqual([30, 70], BernoulliDistribution(probability: 0.7).expectedFrequencies(count: 100))
        XCTAssertEqual([90, 10], BernoulliDistribution(probability: 0.1).expectedFrequencies(count: 100))
        XCTAssertEqual([5, 95], BernoulliDistribution(probability: 0.95).expectedFrequencies(count: 100))
    }
    
    func testDistributionProperties() {
        let b = BernoulliDistribution(probability: 0.7)
        
        XCTAssertEqual(0.7, b.expectation)
        XCTAssertEqual(0.7 * (1 - 0.7), b.variance)
    }
    
    func testSequence() {
        let allowed: Set = [0, 1]
        
        func check(probability: Double, count: Int, bias: Double) {
            let d = BernoulliDistribution(probability: probability)
            let v = SwiftB.generateDiscrete(variable: d, count: count)
            let h = Histogram(v)
            
            XCTAssertTrue(h.validate(allowedValues: allowed))
            
            let validDiff = Int((Double(count) / 100) * bias)
            let expected = d.expectedFrequencies(count: count)
            let actual = h.frequencies.map { $0.frequency }
            
            XCTAssertTrue(closeEqual(expected, actual, delta: validDiff), "expected \(expected), real \(actual), diff \(validDiff)")
        }
        
        for _ in 0...10 {
            check(probability: 0.5, count: 10000, bias: 5)
            check(probability: 0.7, count: 10000, bias: 5)
            check(probability: 0.1, count: 10000, bias: 3)
            check(probability: 0.95, count: 10000, bias: 2)
        }
    }
    
    func testSequenceProperties() {
        func check(probability: Double, count: Int) {
            let d = BernoulliDistribution(probability: probability)
            let s = SwiftB.generateDiscrete(variable: d, count: count)
            
            let mean = SwiftB.mean(s)
            let variance = SwiftB.centralMoment(s, order: 2)
            
            XCTAssertTrue(closeEqual(d.expectation, mean, delta: 0.05), "expectation: expected \(d.expectation), real \(mean)")
            XCTAssertTrue(closeEqual(d.variance, variance, delta: 0.05), "variance: expected \(d.variance), real \(variance)")
        }
        
        for _ in 0...10 {
            check(probability: 0.5, count: 10000)
            check(probability: 0.7, count: 10000)
            check(probability: 0.1, count: 10000)
            check(probability: 0.95, count: 10000)
        }
    }

    static var allTests = [
        ("testExpectedFrequencies", testExpectedFrequencies),
        ("testDistributionProperties", testDistributionProperties),
        ("testSequence", testSequence),
        ("testSequenceProperties", testSequenceProperties),
    ]
}
