import Foundation
import Numerics


extension Array where Self.Element: Real {
    public func centralMoment(order: Int) -> Self.Element  {
        guard count != 0 else { return 0 }
        
        let mean = self.mean()
        
        var sum = Element.zero
        self.withUnsafeBufferPointer { (buf) in
            for i in 0..<self.count {
                sum += Element.pow(buf[i] - mean, order)
            }
        }
        
        return sum / Element(count)
    }
}

extension Array where Self.Element: BinaryInteger {
    public func centralMoment(order: Int) -> Double  {
        guard count != 0 else { return Double.zero }
        
        let mean = self.mean()
        
        var sum = Double.zero
        self.withUnsafeBufferPointer { (buf) in
            for i in 0..<self.count {
                sum += pow(Double(buf[i]) - mean, Double(order))
            }
        }
        
        return sum / Double(count)
    }
}


extension Array where Self.Element: Real {
    public func expectation() -> Element {
        return mean()
    }
    
    public func variance() -> Element {
        return centralMoment(order: 2)
    }
}

extension Array where Self.Element: BinaryInteger {
    public func expectation() -> Double {
        return mean()
    }
    
    public func variance() -> Double {
        return centralMoment(order: 2)
    }
}
