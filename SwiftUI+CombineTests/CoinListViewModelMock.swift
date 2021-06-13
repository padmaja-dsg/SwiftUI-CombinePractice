//
//  CoinListViewModelMock.swift
//  SwiftUI+CombineTests
//
//  Created by Padmaja Unnam on 6/12/21.
//

import Combine
import Foundation
@testable import SwiftUI_Combine

internal final class CoinListViewModelMock: CryptoRepo {
    
    private var coinListViewModel: CoinListViewModel!
    
    func fetchCoins() -> AnyPublisher<CryptoDataContainer, Error> {
        return Just(
            Bundle(for: CoinListViewModelMock.self).loadDataFrom(
                fileName: "MockData", fileExtension: .json))
            .subscribe(on: DispatchQueue.global())
            .decode(type: CryptoDataContainer.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}

enum FileExtentionType: String {
    case json = "json"
}

extension Bundle {
    func loadDataFrom(fileName: String, fileExtension: FileExtentionType) -> Data {
        guard let url = self.url(forResource: fileName, withExtension: fileExtension.rawValue) else {
            preconditionFailure("Failed to locate \(fileName) in bundle.")
        }
        guard let data = try? Data(contentsOf: url) else {
            preconditionFailure("Failed to load \(fileName) data from bundle.")
        }
        return data
    }
}
