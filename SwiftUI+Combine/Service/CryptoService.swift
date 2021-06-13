//
//  CryptoService.swift
//  SwiftUI+Combine
//
//  Created by Padmaja Unnam on 6/12/21.
//

import Foundation
import Combine

final class CryptoService: CryptoRepo {

    var components: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.coinranking.com"
        components.path = "/v1/public/coins"
        components.queryItems = [URLQueryItem(name: "base", value: "USD"), URLQueryItem(name: "timePeriod", value: "24h")]
        return components
    }
    
    func fetchCoins() -> AnyPublisher<CryptoDataContainer, Error> {
        return URLSession.shared.dataTaskPublisher(for: components.url!)
            .map{ $0.data }
            .decode(type: CryptoDataContainer.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

public protocol CryptoRepo {
    func fetchCoins() -> AnyPublisher<CryptoDataContainer, Error>
}
