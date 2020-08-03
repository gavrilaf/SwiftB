import XCTest
@testable import SwiftB

final class DiscreteDistibutionTests: XCTestCase {
    func testBernoulli() {
        let allowed: Set = [0, 1]
        
        let v1 = SwiftB.generateDiscrete(variable: BernoulliDistribution(probability: 0.5), count: 100)
        let h1 = Histogram(v1)
        
        XCTAssertTrue(h1.isValid(allowed: allowed))
    }

    static var allTests = [
        ("testBernoulli", testBernoulli),
    ]
}
