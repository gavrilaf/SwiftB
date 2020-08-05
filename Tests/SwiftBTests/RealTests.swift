import XCTest
@testable import SwiftB

final class RealTests: XCTestCase {
    func testPowDouble() {
        let x: Double = 2.0
        
        XCTAssertEqual(4.0, x.toPower(2.0))
    }
    
    func testPowFloat() {
        let x: Float = 2.0
        
        XCTAssertEqual(4.0, x.toPower(2.0))
    }
    
}
