import XCTest
@testable import SwiftB

final class BinomialDistibutionTests: XCTestCase {
    func testProperties() {
        let b = BinomialDistribution(trials: 100, propability: 0.7)
        
        XCTAssertEqual(0...100, b.bounds)
        
        XCTAssertEqual(70, b.expectation, accuracy: T.accuracy)
        XCTAssertEqual(21, b.variance, accuracy: T.accuracy)
    }
    
    func testSequence() {
        T.checkDistrProperties(BinomialDistribution(trials: 100, propability: 0.5))
        T.checkDistrProperties(BinomialDistribution(trials: 20, propability: 0.1))
        T.checkDistrProperties(BinomialDistribution(trials: 250, propability: 0.01))
        T.checkDistrProperties(BinomialDistribution(trials: 50, propability: 0.95))
        T.checkDistrProperties(BinomialDistribution(trials: 1000, propability: 0.5))
        T.checkDistrProperties(BinomialDistribution(trials: 100000, propability: 0.87))
    }

    static var allTests = [
        ("testDistributionProperties", testProperties),
        ("testSequenceProperties", testSequence),
    ]
}
