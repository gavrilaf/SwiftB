import XCTest
@testable import SwiftB

final class SwiftBTests: XCTestCase {
    func testEvenOdd() {
        XCTAssertTrue(SwiftB.isEven(2))
        XCTAssertFalse(SwiftB.isEven(3))
        
        XCTAssertTrue(SwiftB.isOdd(21))
        XCTAssertFalse(SwiftB.isOdd(124))
    }
    
    static var allTests = [
        ("testEvenOdd", testEvenOdd),
    ]
}

