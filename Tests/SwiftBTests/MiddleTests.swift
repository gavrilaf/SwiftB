import XCTest
@testable import SwiftB

final class MiddleTests: XCTestCase {
    func testMean() {
        XCTAssertEqual(SwiftB.mean([]), 0)
        XCTAssertEqual(SwiftB.mean([10]), 10)
        
        XCTAssertEqual(SwiftB.mean([1, 1, 1]), 1)
        XCTAssertEqual(SwiftB.mean([1, 2, 3]), 2)
        
        XCTAssertEqual(SwiftB.mean([1.1, 1.2, 1.3, 1.4, 1.5]), 1.3)
        XCTAssertEqual(SwiftB.mean([5, 6]), 5.5)
    }

    func testMedian() {
        XCTAssertEqual(SwiftB.median([]), 0)
        XCTAssertEqual(SwiftB.median([10]), 10)
        
        XCTAssertEqual(SwiftB.median([1, 1, 1]), 1)
        XCTAssertEqual(SwiftB.median([1, 2, 3]), 2)
        XCTAssertEqual(SwiftB.median([1, 12, 19.5, 3, -5]), 3)
        XCTAssertEqual(SwiftB.median([1.1, 1.2, 1.3, 1.4, 1.5]), 1.3)
        
        XCTAssertEqual(SwiftB.median([5, 6]), 5.5)
        XCTAssertEqual(SwiftB.median([5, 6, 10, 100]), 8)
        XCTAssertEqual(SwiftB.median([1, 12, 19.5, 3, -5, 8]), 5.5)
    }
    
    static var allTests = [
        ("testMean", testMean),
        ("testMedian", testMedian),
    ]
}
