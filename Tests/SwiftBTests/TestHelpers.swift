import XCTest
import SwiftB

struct T {
    static let accuracy = 0.0000000000001
    
    static let tries = 5000
    
    static func checkDistrProperties<T: DiscreteRandomVariable>(_ d: T, tries: Int = tries) {
        let s = SwiftB.generateDiscrete(variable: d, count: tries)
        
        let expectation = s.expectation()
        let variance = s.variance()
        
        let accuracy = Double(tries) * 0.05 // 95 %
        
        XCTAssertEqual(d.expectation, expectation, accuracy: accuracy, "expectation: expected \(d.expectation), real \(expectation)")
        XCTAssertEqual(d.variance, variance, accuracy: accuracy, "variance: expected \(d.variance), real \(variance)")
    }
}
