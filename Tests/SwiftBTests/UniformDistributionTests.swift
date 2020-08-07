import XCTest
@testable import SwiftB

final class UniformDistibutionTests: XCTestCase {
    
    func testSystemUniform() {
        let d = SystemUniformDistribution(bounds: 0.0...5.0)
        let s = SwiftB.generateContinuous(variable: d, count: 10000)
        
        let mean = s.mean()
        let variance = s.centralMoment(order: 2)
        
        XCTAssertTrue(closeEqual(d.expectation, mean, delta: 0.05), "expectation: expected \(d.expectation), real \(mean)")
        XCTAssertTrue(closeEqual(d.variance, variance, delta: 0.05), "variance: expected \(d.variance), real \(variance)")
    }
}
