import XCTest
@testable import SwiftB

final class DiscreteDistibutionTests: XCTestCase {
    func testBernoulli() {
        let v1 = SwiftB.generate(discrete: Bernoulli(probablity: 0.5))
    }

    static var allTests = [
        ("testBernoulli", testBernoulli),
    ]
}
