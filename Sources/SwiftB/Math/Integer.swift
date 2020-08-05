import Foundation

extension BinaryInteger {
    
    public var isEven: Bool {
        return self.isMultiple(of: 2)
    }
    
    public var isOdd: Bool {
        return !self.isEven
    }
    
}
