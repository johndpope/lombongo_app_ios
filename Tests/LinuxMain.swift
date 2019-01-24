import XCTest

import lombongo_appTests

var tests = [XCTestCaseEntry]()
tests += lombongo_appTests.allTests()
XCTMain(tests)