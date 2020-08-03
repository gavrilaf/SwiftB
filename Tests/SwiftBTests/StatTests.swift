import XCTest
@testable import SwiftB

final class StatTests: XCTestCase {
    func testEvenOdd() {
        XCTAssertTrue(Stat.isEven(2))
        XCTAssertFalse(Stat.isEven(3))
        
        XCTAssertTrue(Stat.isOdd(21))
        XCTAssertFalse(Stat.isOdd(124))
    }
    
    static var allTests = [
        ("testEvenOdd", testEvenOdd),
    ]
}

