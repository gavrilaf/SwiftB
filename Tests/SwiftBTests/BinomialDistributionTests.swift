import XCTest
@testable import SwiftB

final class BinomialDistibutionTests: XCTestCase {
    func testDistributionProperties() {
        let b = BinomialDistribution(trials: 100, propability: 0.7)
        
        XCTAssertEqual(0...100, b.bounds)
        
        XCTAssertEqual(70, b.expectation, accuracy: T.accuracy)
        XCTAssertEqual(21, b.variance, accuracy: T.accuracy)
    }
    
    func testSequenceProperties() {
        func check(distr: BinomialDistribution, tries: Int) {
            let s = SwiftB.generateDiscrete(variable: distr, count: tries)
            
            let expectation = s.expectation()
            let variance = s.variance()
            
            let accuracy = Double(tries) * 0.05 // 95 %
            
            XCTAssertEqual(distr.expectation, expectation, accuracy: accuracy, "expectation: expected \(distr.expectation), real \(expectation)")
            XCTAssertEqual(distr.variance, variance, accuracy: accuracy, "variance: expected \(distr.variance), real \(variance)")
        }
        
        let triesCount = 5000
        
        check(distr: BinomialDistribution(trials: 100, propability: 0.5), tries: triesCount)
        check(distr: BinomialDistribution(trials: 20, propability: 0.1), tries: triesCount)
        check(distr: BinomialDistribution(trials: 250, propability: 0.01), tries: triesCount)
        check(distr: BinomialDistribution(trials: 50, propability: 0.95), tries: triesCount)
        check(distr: BinomialDistribution(trials: 1000, propability: 0.5), tries: triesCount)
        check(distr: BinomialDistribution(trials: 10000, propability: 0.87), tries: triesCount)
    }

    static var allTests = [
        ("testDistributionProperties", testDistributionProperties),
        ("testSequenceProperties", testSequenceProperties),
    ]
}
