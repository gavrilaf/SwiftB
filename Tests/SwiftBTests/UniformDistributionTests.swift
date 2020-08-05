import XCTest
@testable import SwiftB

final class UniformDistibutionTests: XCTestCase {
    
    func testSystemUniform() {
        let d = SystemStandardUniformVariable(bounds: 0.0...5.0)
        let s = SwiftB.generateContinuous(variable: d, count: 10000)
        
        let mean = SwiftB.mean(s)
        let variance = SwiftB.centralMoment(s, order: 2)
        
        XCTAssertTrue(SwiftB.closeEqual(d.expectation, mean, delta: 0.05), "expectation: expected \(d.expectation), real \(mean)")
        XCTAssertTrue(SwiftB.closeEqual(d.variance, variance, delta: 0.05), "variance: expected \(d.variance), real \(variance)")
    }
}
