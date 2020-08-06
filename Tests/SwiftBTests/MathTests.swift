import XCTest
@testable import SwiftB

final class MathTests: XCTestCase {
    func testEvenOdd() {
        XCTAssertTrue(2.isEven)
        XCTAssertFalse(3.isEven)
        
        XCTAssertTrue(21.isOdd)
        XCTAssertFalse(124.isOdd)
    }
    
    func testCloseEqual() {
        XCTAssertTrue(closeEqual(10, 12, delta: 2))
        XCTAssertTrue(closeEqual(1.0, 1.1, delta: 0.11))
        
        XCTAssertFalse(closeEqual(10, 12, delta: 1))
        XCTAssertFalse(closeEqual(1.0, 1.1, delta: 0.09))
        
        XCTAssertTrue(closeEqual([], [], delta: 1))
        XCTAssertTrue(closeEqual([1, 1], [2, 2], delta: 1))
        XCTAssertTrue(closeEqual([10], [10], delta: 1))
        XCTAssertTrue(closeEqual([1.0, 1.1, 1.11], [1.0, 1.102, 1.1], delta: 0.11))
        
        XCTAssertFalse(closeEqual([], [1], delta: 1))
        XCTAssertFalse(closeEqual([1], [], delta: 1))
        XCTAssertFalse(closeEqual([1, 1], [1], delta: 1))
        XCTAssertFalse(closeEqual([1], [1, 1], delta: 1))
        
        XCTAssertFalse(closeEqual([1.1, 1.2], [1.1, 1.4], delta: 0.1))
    }
    
    static var allTests = [
        ("testEvenOdd", testEvenOdd),
        ("testCloseEqual", testCloseEqual),
    ]
}

