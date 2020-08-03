import XCTest
@testable import SwiftB

final class MiddleTests: XCTestCase {
    func testMean() {
        XCTAssertEqual(Stat.mean([]), 0)
        XCTAssertEqual(Stat.mean([10]), 10)
        
        XCTAssertEqual(Stat.mean([1, 1, 1]), 1)
        XCTAssertEqual(Stat.mean([1, 2, 3]), 2)
        
        XCTAssertEqual(Stat.mean([1.1, 1.2, 1.3, 1.4, 1.5]), 1.3)
        XCTAssertEqual(Stat.mean([5, 6]), 5.5)
    }

    func testMedian() {
        XCTAssertEqual(Stat.median([]), 0)
        XCTAssertEqual(Stat.median([10]), 10)
        
        XCTAssertEqual(Stat.median([1, 1, 1]), 1)
        XCTAssertEqual(Stat.median([1, 2, 3]), 2)
        XCTAssertEqual(Stat.median([1, 12, 19.5, 3, -5]), 3)
        XCTAssertEqual(Stat.median([1.1, 1.2, 1.3, 1.4, 1.5]), 1.3)
        
        XCTAssertEqual(Stat.median([5, 6]), 5.5)
        XCTAssertEqual(Stat.median([5, 6, 10, 100]), 8)
        XCTAssertEqual(Stat.median([1, 12, 19.5, 3, -5, 8]), 5.5)
    }
    
    static var allTests = [
        ("testMean", testMean),
    ]
}
