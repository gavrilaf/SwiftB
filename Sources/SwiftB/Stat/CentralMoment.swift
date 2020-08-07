import Foundation
import Numerics


extension Array where Self.Element: Real {
    public func centralMoment(order: Int) -> Self.Element  {
        guard count != 0 else { return 0 }
        
        typealias E = Self.Element
        
        let mean = self.mean()
        
        var sum = Self.Element(0)
        self.withUnsafeBufferPointer { (buf) in
            for i in 0..<self.count {
                sum += Self.Element.pow(buf[i] - mean, order)
            }
        }
        
        return sum / Self.Element(count)
    }
}

extension Array where Self.Element: BinaryInteger {
    public func centralMoment(order: Int) -> Double  {
        guard count != 0 else { return 0 }
        
        let mean = self.mean()
        
        var sum = 0.0
        self.withUnsafeBufferPointer { (buf) in
            for i in 0..<self.count {
                sum += Double.pow(Double(buf[i]) - mean, order)
            }
        }
        
        return sum / Double(count)
    }
}


