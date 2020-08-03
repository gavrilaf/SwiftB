import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(StatTests.allTests),
        testCase(MiddleTests.allTests),
        testCase(RandomTests.allTests),        
    ]
}
#endif
