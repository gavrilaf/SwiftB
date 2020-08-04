import Foundation

public struct Histogram<T:  Hashable & Comparable> {
    public typealias Element = (value:T, frequency: Int)
    
    public init<S: Sequence>(_ values: S) where S.Element == T {
        var fr = [T: Int]()
        for v in values {
            fr[v] = fr[v, default: 0] + 1
        }
        
        var r = [Element]()
        let keys = fr.keys.sorted()
        for k in keys {
            r.append((k, fr[k]!))
        }
        
        self.frequencies = r
    }
    
    public let frequencies: [Element]
    
    public func validate(allowedValues: Set<T>) -> Bool {
        for e in frequencies {
            if !allowedValues.contains(e.value) {
                return false
            }
        }
        
        return true
    }
}

extension Histogram: CustomStringConvertible {
    public var description: String {
        var s = ""
        for e in frequencies {
            if !s.isEmpty {
                s += ","
            }
            s += "(\(e.value): \(e.frequency))"
        }
        
        return s
    }
}
