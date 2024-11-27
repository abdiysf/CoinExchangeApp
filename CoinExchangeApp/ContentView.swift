//
//  ContentView.swift
//  CoinExchangeApp
//
//  Created by Abdirahman Standard on 28/11/24.
//

import SwiftUI

struct ContentView: View {
//    var service = Service()
    var body: some View {
        VStack {
            ExchangeRateView()
        }
        .padding()
//        .task {
//            let service = Service()
//            await service.fetchExchangeRates(for: "USD")
//        }
    }
}

#Preview {
    ContentView()
}
