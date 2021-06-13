//
//  SwiftUI_CombineTests.swift
//  SwiftUI+CombineTests
//
//  Created by Padmaja Unnam on 6/12/21.
//

import XCTest
@testable import SwiftUI_Combine

class SwiftUI_CombineTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
extension XCTestCase {
    internal func wait(for duration: TimeInterval) {
            let waitExpectation = expectation(description: "Waiting")
            let when = DispatchTime.now() + duration
            DispatchQueue.main.asyncAfter(deadline: when) {
                waitExpectation.fulfill()
            }
            waitForExpectations(timeout: duration + 0.5)
        }
}
