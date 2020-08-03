import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SwiftBTests.allTests),
        testCase(MiddleTests.allTests),
        testCase(RandomTests.allTests),        
    ]
}
#endif
