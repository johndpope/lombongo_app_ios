import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(lombongo_appTests.allTests),
    ]
}
#endif