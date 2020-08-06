import XCTest
@testable import SwiftB

final class CentralMomentsTests: XCTestCase {
    func testCentralMoment() {
        let s = [3, -1, 1, 4.1, 4.1, 0.7]
        let expected = [1, 0, 3.5847222222, -1.5999259259, 20.6794136574]
        
        for order in 0..<4 {
            let moment = SwiftB.centralMoment(s, order: order)
            let expected = expected[order]
            
            XCTAssertTrue(closeEqual(expected, moment, delta: 0.0000000001), "central moment for order \(order), expected \(expected), actual \(moment)")
        }
    }
    
    func testCentralMoment2() {
        let s: [Float] = [1, 2, 3, 4, 5]
        let expected: [Float] = [1, 0, 2, 0, 6.8]
        
        for order in 0..<4 {
            let moment = SwiftB.centralMoment(s, order: order)
            let expected = expected[order]
            
            XCTAssertTrue(closeEqual(expected, moment, delta: 0.01), "central moment for order \(order), expected \(expected), actual \(moment)")
        }
    }
    
    func testEmpty() {
        let s: [Float] = []
        let moment = SwiftB.centralMoment(s, order: 1) // Compiler crashes in case SwiftB.centralMoment([], order: 1)
        XCTAssertTrue(closeEqual(0, moment, delta: 0.0000000001))
    }
    
    func testOneItem() {
        let moment = SwiftB.centralMoment([1.0], order: 1)
        XCTAssertTrue(closeEqual(0, moment, delta: 0.0000000001))
    }
    
}
