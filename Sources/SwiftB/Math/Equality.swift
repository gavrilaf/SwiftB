import Foundation

public typealias ComparableSignedNumeric = Comparable & SignedNumeric

public func closeEqual<T: ComparableSignedNumeric>(_ lhs: T, _ rhs: T, delta: T) -> Bool {
    let s = abs(rhs - lhs)
    return s <= delta
}

public func closeEqual<S: Sequence>(_ lhs: S, _ rhs: S, delta: S.Element) -> Bool where S.Element: ComparableSignedNumeric {
    var li = lhs.makeIterator()
    var ri = rhs.makeIterator()
    
    var le = li.next()
    var re = ri.next()
    
    while let _le = le, let _re = re {
        if !closeEqual(_le, _re, delta: delta) {
            return false
        }
        
        le = li.next()
        re = ri.next()
    }
    
    return le == nil && re == nil
}
