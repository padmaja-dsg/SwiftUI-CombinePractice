//
//  CoinListViewModelTests.swift
//  SwiftUI+CombineTests
//
//  Created by Padmaja Unnam on 6/12/21.
//

import XCTest
@testable import SwiftUI_Combine

class CoinListViewModelTests: XCTestCase {
    
    private var coinListViewModel: CoinListViewModel!
    let modelMock = CoinListViewModelMock()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCoinData() {
        modelMock.fetchCoins()
    }

}
