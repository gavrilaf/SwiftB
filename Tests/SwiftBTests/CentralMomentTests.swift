import XCTest
@testable import SwiftB

final class CentralMomentsTests: XCTestCase {
    func testCentralMoment() {
        let s = [3, -1, 1, 4.1, 4.1, 0.7]
        let expected = [1, 0, 3.5847222222, -1.5999259259, 20.6794136574]
        
        for order in 0..<4 {
            let moment = s.centralMoment(order: order)
            let expected = expected[order]
            
            XCTAssertEqual(expected, moment, accuracy: TH.accuracy, "central moment for order \(order), expected \(expected), actual \(moment)")
        }
    }
    
    func testCentralMoment2() {
        let s: [Float] = [1, 2, 3, 4, 5]
        let expected: [Float] = [1, 0, 2, 0, 6.8]
        
        for order in 0..<4 {
            let moment = s.centralMoment(order: order)
            let expected = expected[order]
            
            XCTAssertEqual(expected, moment, accuracy: Float(TH.accuracy), "central moment for order \(order), expected \(expected), actual \(moment)")
        }
    }
    
    func testEmpty() {
        let s: [Double] = []
        let moment = s.centralMoment(order: 1)
        
        XCTAssertEqual(0.0, moment, accuracy: TH.accuracy)
    }
    
    func testOneItem() {
        let moment = [1.0].centralMoment(order: 1)
        
        XCTAssertEqual(0, moment, accuracy: TH.accuracy)
    }
    
}
