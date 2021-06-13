//
//  CoinViewModel.swift
//  SwiftUI+Combine
//
//  Created by Padmaja Unnam on 6/12/21.
//

import Foundation

class CoinViewModel: ObservableObject, Identifiable {
    private let coin: Coin

    @Published private(set) var name: String = ""
    @Published private(set) var displayText: String = ""
    @Published private(set) var formattedPrice: String = ""

    init(_ coin: Coin) {
        self.coin = coin

        self.name = coin.name
        self.formattedPrice = NumberFormatter.formattedPrice(coin.price)
        self.displayText = name + " - " + formattedPrice
    }
}


extension NumberFormatter {
    static func formattedPrice(_ price: String) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency

        guard let price = Double(price), let formattedPrice = numberFormatter.string(from: NSNumber(value: price)) else {
            return ""
        }
        return formattedPrice
    }
}
