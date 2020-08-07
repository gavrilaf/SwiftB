import XCTest
@testable import SwiftB

final class BinomialDistibutionTests: XCTestCase {
    func testDistributionProperties() {
        let b = BinomialDistribution(trials: 100, propability: 0.7)
        
        XCTAssertEqual(0...100, b.bounds)
        
        XCTAssertEqual(70, b.expectation, accuracy: TH.accuracy)
        XCTAssertEqual(21, b.variance, accuracy: TH.accuracy)
    }
    
    func testSequenceProperties() {
        func check(distr: BinomialDistribution, count: Int) {
            let s = SwiftB.generateDiscrete(variable: distr, count: count)
            let mean = s.mean()
            let variance = s.centralMoment(order: 2)
            
            XCTAssertEqual(distr.expectation, mean, accuracy: 1.0, "expectation: expected \(distr.expectation), real \(mean)")
            XCTAssertEqual(distr.variance, variance, accuracy: 3.0, "variance: expected \(distr.variance), real \(variance)")
        }
        
        let triesCount = 1000
        
        for _ in 0...10 {
            check(distr: BinomialDistribution(trials: 100, propability: 0.5), count: triesCount)
            check(distr: BinomialDistribution(trials: 20, propability: 0.1), count: triesCount)
            check(distr: BinomialDistribution(trials: 250, propability: 0.01), count: triesCount)
            check(distr: BinomialDistribution(trials: 50, propability: 0.95), count: triesCount)
        }
    }

    static var allTests = [
        ("testDistributionProperties", testDistributionProperties),
        ("testSequenceProperties", testSequenceProperties),
    ]
}
