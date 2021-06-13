//
//  CoinListViewModel.swift
//  SwiftUI+Combine
//
//  Created by Padmaja Unnam on 6/12/21.
//

import Foundation
import Combine

class CoinListViewModel: ObservableObject {
    
    let cryptoService = CryptoService()
    @Published var coinViewModels = [CoinViewModel]()
    
    var cancellable: AnyCancellable?
    
    func fetchCoins() {
        cancellable = cryptoService.fetchCoins().sink(receiveCompletion: { _ in
            
        }, receiveValue: { cryptoContainer in
            self.coinViewModels = cryptoContainer.data.coins.map { CoinViewModel($0)}
            print(self.coinViewModels)
        })
    }
}
