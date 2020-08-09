import XCTest
@testable import SwiftB

final class BernoulliDistibutionTests: XCTestCase {
    
    func testProperties() {
        let b = BernoulliDistribution(probability: 0.7)
        
        XCTAssertEqual(0.7, b.expectation)
        XCTAssertEqual(0.7 * (1 - 0.7), b.variance)
    }
    
    func testSequence() {
        T.checkDistrProperties(BernoulliDistribution(probability: 0.5))
        T.checkDistrProperties(BernoulliDistribution(probability: 0.7))
        T.checkDistrProperties(BernoulliDistribution(probability: 0.1))
        T.checkDistrProperties(BernoulliDistribution(probability: 0.95))
    }

    static var allTests = [
        ("testProperties", testProperties),
        ("testSequence", testSequence)
    ]
}
