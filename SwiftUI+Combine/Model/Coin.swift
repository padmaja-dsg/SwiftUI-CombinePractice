//
//  Coin.swift
//  SwiftUI+Combine
//
//  Created by Padmaja Unnam on 6/12/21.
//

import Foundation

public struct CryptoDataContainer: Decodable {
    let status: String
    let data: CryptoData
}

struct CryptoData: Decodable {
    let coins: [Coin]
}

public struct Coin: Decodable, Hashable {
    let name: String
    let price: String
}
