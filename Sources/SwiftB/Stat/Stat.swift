import Foundation

public struct Stat {}

extension Stat {
    public static func isEven<T: BinaryInteger>(_ n: T) -> Bool {
        return n.isMultiple(of: 2)
    }
    
    public static func isOdd<T: BinaryInteger>(_ n: T) -> Bool {
        return !isEven(n)
    }
}
