import Foundation

/**
 Standard uniform distribution (uniform distibution on [0, 1]
 */
struct StandardUniform: ContinuousRandomVariable {
    func Value() -> Double {
        return drand48()
    }
}
