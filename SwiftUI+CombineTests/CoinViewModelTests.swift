//
//  CoinViewModelTests.swift
//  SwiftUI+CombineTests
//
//  Created by Padmaja Unnam on 13/06/21.
//

import XCTest
@testable import SwiftUI_Combine

class CoinViewModelTests: XCTestCase {

    var coinViewModel: CoinViewModelMock!

    override func setUpWithError() throws {
        _ = CoinViewModelMock.fetchCoinData().sink { _ in

        } receiveValue: { coin in
            self.coinViewModel = CoinViewModelMock(coin)
        }
        wait(for: 1)
        XCTAssertNotNil(self.coinViewModel, "CoinViewModel is nil")
    }

    override func tearDownWithError() throws {

    }

    func testProperties() {

        let name = "Bitcoin"
        let priceFormatted = NumberFormatter.formattedPrice("35404.7556421455")
        let displayText = name + " - " + priceFormatted

        XCTAssertEqual(self.coinViewModel.name, name)
        XCTAssertEqual(self.coinViewModel.formattedPrice, priceFormatted)
        XCTAssertEqual(self.coinViewModel.displayText, displayText)
    }

}
