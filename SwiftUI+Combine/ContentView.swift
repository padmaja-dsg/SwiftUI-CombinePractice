//
//  ContentView.swift
//  SwiftUI+Combine
//
//  Created by Padmaja Unnam on 6/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var viewModel = CoinListViewModel()
    var body: some View {
        NavigationView {
            List(viewModel.coinViewModels) { coinViewModel in
                Text(coinViewModel.displayText)
            }.onAppear {
                self.viewModel.fetchCoins()
            }
            .navigationBarTitle("Coins")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
