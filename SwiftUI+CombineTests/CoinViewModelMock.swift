//
//  CoinViewModelMock.swift
//  SwiftUI+CombineTests
//
//  Created by Padmaja Unnam on 6/12/21.
//

import Combine
import Foundation
@testable import SwiftUI_Combine

internal final class CoinViewModelMock: CoinViewModel {

    static func fetchCoinData() -> AnyPublisher<Coin, Error> {
            return Just(
                Bundle(for: CoinViewModelMock.self).loadDataFrom(
                    fileName: "CoinMock", fileExtension: .json))
                .subscribe(on: DispatchQueue.global())
                .decode(type: Coin.self, decoder: JSONDecoder())
                .eraseToAnyPublisher()
    }    
}
