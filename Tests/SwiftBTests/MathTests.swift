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
    
    func testLnFactorial() {
        XCTAssertEqual(0, lnFuctorial(0), accuracy: T.accuracy)
        XCTAssertEqual(0, lnFuctorial(1), accuracy: T.accuracy)
        XCTAssertEqual(8.52516136106541, lnFuctorial(7), accuracy: T.accuracy)
        XCTAssertEqual(129.1239336391272, lnFuctorial(45), accuracy: T.accuracy)
        XCTAssertEqual(1134.0452317908529, lnFuctorial(250), accuracy: T.accuracy)
    }
    
    func testLnCombination() {
        XCTAssertEqual(-1, lnCombination(7, 9), accuracy: T.accuracy)
        
        XCTAssertEqual(0, lnCombination(7, 7), accuracy: T.accuracy)
        XCTAssertEqual(0, lnCombination(7, 0), accuracy: T.accuracy)
        
        XCTAssertEqual(3.55534806148941, lnCombination(7, 3), accuracy: T.accuracy)
        XCTAssertEqual(2.30258509299404, lnCombination(5, 2), accuracy: T.accuracy)
        XCTAssertEqual(6.21460809842219, lnCombination(500, 1), accuracy: T.accuracy)
        XCTAssertEqual(46.95109294903053, lnCombination(500, 10), accuracy: T.accuracy)
    }
    
        
    static var allTests = [
        ("testEvenOdd", testEvenOdd),
        ("testCloseEqual", testCloseEqual),
        ("testLnFactorial", testLnFactorial),
        ("testLnCombination", testLnCombination),
    ]
}

