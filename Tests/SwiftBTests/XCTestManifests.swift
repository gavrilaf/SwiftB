import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(BernoulliDistibutionTests.allTests),
        testCase(BinomialDistibutionTests.allTests),
        testCase(CentralMomentsTests.allTests),
        testCase(MathTests.allTests),
        testCase(MiddleTests.allTests),
        testCase(UniformDistibutionTests.allTests)
    ]
}
#endif
