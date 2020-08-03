import Foundation

public struct Histogram<T:  Hashable> {
    public init<S: Sequence>(_ values: S) where S.Element == T {
        var fr = [T: Int]()
        for v in values {
            fr[v] = fr[v, default: 0] + 1
        }
        
        self.frequencies = fr
    }
    
    public let frequencies: [T: Int]
    
    public func isValid(allowed: Set<T>) -> Bool {
        for k in frequencies.keys {
            if !allowed.contains(k) {
                return false
            }
        }
        
        return true
    }
}
