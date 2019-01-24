import XCTest
@testable import lombongo_app

final class lombongo_appTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(lombongo_app().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
