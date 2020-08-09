import Foundation
import Numerics

extension Array where Self.Element: Real {
    public func mean() -> Self.Element  {
        guard count != 0 else { return 0 }
        
        var sum = Self.Element(0)
        self.withUnsafeBufferPointer { (buf)in
            for i in 0..<self.count {
                sum += buf[i]
            }
        }
        
        return sum / Self.Element(count)
    }
}

extension Array where Self.Element: BinaryInteger {
    public func mean() -> Double  {
        guard count != 0 else { return 0 }
        
        var sum = 0.0
        self.withUnsafeBufferPointer { (buf)in
            for i in 0..<self.count {
                sum += Double(buf[i])
            }
        }
        
        return sum / Double(count)
    }
}


extension SwiftB {
    // TODO: Convert into the Array extension
    
    /**
       Computes  median of the sequence
    */
    public static func median<T: Sequence>(_ s: T) -> T.Element where T.Element: BinaryFloatingPoint {
        return SwiftB.nlognMedian(s) // TODO: improve implementation for O(n), use article https://rcoh.me/posts/linear-time-median-finding/
    }
}

// MARK:- helpers
extension SwiftB {
    static func nlognMedian<T: Sequence>(_ s: T) -> T.Element where T.Element: BinaryFloatingPoint {
        let sorted = s.sorted()
        let len = sorted.count
        
        if len == 0 {
            return 0
        } else if len == 1 {
            return sorted[0]
        }
        
        if len.isOdd {
            return sorted[len / 2]
        } else {
            return (sorted[len / 2 - 1] + sorted[len / 2]) / 2
        }
    }
}
