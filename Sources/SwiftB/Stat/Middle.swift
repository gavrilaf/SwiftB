import Foundation

extension SwiftB {

    /**
        Computes arithmetic mean of the sequence
     */
    public static func mean<T: Sequence>(_ s: T) -> T.Element where T.Element: FloatingPoint {
        var sum = T.Element(0)
        var count = 0
        
        for t in s {
            sum += t
            count += 1
        }
        
        if count == 0 {
            return 0
        }
        
        return sum / T.Element(count)
    }

    /**
       Computes  median of the sequence
    */
    public static func median<T: Sequence>(_ s: T) -> T.Element where T.Element: FloatingPoint {
        return SwiftB.nlognMedian(s) // TODO: improve implementation for O(n), use article https://rcoh.me/posts/linear-time-median-finding/
    }
}

// MARK:- helpers
extension SwiftB {
    static func nlognMedian<T: Sequence>(_ s: T) -> T.Element where T.Element: FloatingPoint {
        let sorted = s.sorted()
        let len = sorted.count
        
        if len == 0 {
            return 0
        } else if len == 1 {
            return sorted[0]
        }
        
        if SwiftB.isOdd(len) {
            return sorted[len / 2]
        } else {
            return (sorted[len / 2 - 1] + sorted[len / 2]) / 2
        }
    }
}
