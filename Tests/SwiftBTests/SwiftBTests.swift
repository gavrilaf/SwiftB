import XCTest
@testable import SwiftB

final class SwiftBTests: XCTestCase {
    /*func testEvenOdd() {
        XCTAssertTrue(SwiftB.isEven(2))
        XCTAssertFalse(SwiftB.isEven(3))
        
        XCTAssertTrue(SwiftB.isOdd(21))
        XCTAssertFalse(SwiftB.isOdd(124))
    }*/
    
    func testCloseEqual() {
        XCTAssertTrue(SwiftB.closeEqual(10, 12, delta: 2))
        XCTAssertTrue(SwiftB.closeEqual(1.0, 1.1, delta: 0.11))
        
        XCTAssertFalse(SwiftB.closeEqual(10, 12, delta: 1))
        XCTAssertFalse(SwiftB.closeEqual(1.0, 1.1, delta: 0.09))
        
        
        XCTAssertTrue(SwiftB.closeEqual([], [], delta: 1))
        XCTAssertTrue(SwiftB.closeEqual([1, 1], [2, 2], delta: 1))
        XCTAssertTrue(SwiftB.closeEqual([10], [10], delta: 1))
        XCTAssertTrue(SwiftB.closeEqual([1.0, 1.1, 1.11], [1.0, 1.102, 1.1], delta: 0.11))
        
        XCTAssertFalse(SwiftB.closeEqual([], [1], delta: 1))
        XCTAssertFalse(SwiftB.closeEqual([1], [], delta: 1))
        XCTAssertFalse(SwiftB.closeEqual([1, 1], [1], delta: 1))
        XCTAssertFalse(SwiftB.closeEqual([1], [1, 1], delta: 1))
        
        XCTAssertFalse(SwiftB.closeEqual([1.1, 1.2], [1.1, 1.4], delta: 0.1))
    }
    
    static var allTests = [
        //("testEvenOdd", testEvenOdd),
        ("testCloseEqual", testCloseEqual),
    ]
}

