import Foundation
import Numerics

extension SwiftB {
    
    public static func centralMoment<S: Sequence>(_ s: S, order: Int) -> S.Element where S.Element: Real {
        typealias E = S.Element
        
        let mean = SwiftB.mean(s)
        
        var count = 0
        var sum: E = 0
        for v in s {
            sum += E.pow((v - mean), order)
            count += 1
        }
        
        if count == 0 {
            return E(count)
        }
        
        return sum / E(count)
    }
    
    // TODO: Temporary solution, fix it!
    public static func centralMoment<S: Sequence>(_ s: S, order: Int) -> Double where S.Element: BinaryInteger {
        return centralMoment(s.map { Double($0) }, order: order)
    }
}
