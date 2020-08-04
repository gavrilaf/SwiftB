import XCTest
@testable import SwiftB

final class DiscreteDistibutionTests: XCTestCase {
    
    func testBernoulliExpected() {
        XCTAssertEqual([50, 50], BernoulliDistribution(probability: 0.5).expectedFrequencies(count: 100))
        XCTAssertEqual([30, 70], BernoulliDistribution(probability: 0.7).expectedFrequencies(count: 100))
        XCTAssertEqual([90, 10], BernoulliDistribution(probability: 0.1).expectedFrequencies(count: 100))
        XCTAssertEqual([5, 95], BernoulliDistribution(probability: 0.95).expectedFrequencies(count: 100))
    }
    
    func testBernoulliDistribution() {
        let allowed: Set = [0, 1]
        
        func checkBernoulli(probability: Double, count: Int, bias: Double) {
            let d = BernoulliDistribution(probability: probability)
            let v = SwiftB.generateDiscrete(variable: d, count: count)
            let h = Histogram(v)
            
            XCTAssertTrue(h.validate(allowedValues: allowed))
            
            let validDiff = Int((Double(count) / 100) * bias)
            let expected = d.expectedFrequencies(count: count)
            let actual = h.frequencies.map { $0.frequency }
            
            XCTAssertTrue(SwiftB.closeEqual(expected, actual, delta: validDiff), "expected \(expected), real \(actual), diff \(validDiff)")
        }
        
        for _ in 0...10 {
            checkBernoulli(probability: 0.5, count: 1000, bias: 7)
            checkBernoulli(probability: 0.7, count: 1000, bias: 5)
            checkBernoulli(probability: 0.1, count: 1000, bias: 3)
            checkBernoulli(probability: 0.95, count: 1000, bias: 2.5)
        }
    }

    static var allTests = [
        ("testBernoulliExpected", testBernoulliExpected),
        ("testBernoulliDistribution", testBernoulliDistribution),
    ]
}
