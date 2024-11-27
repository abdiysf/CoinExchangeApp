//
//  ExchangeRateView.swift
//  CoinApp
//
//  Created by Abdirahman Standard on 27/11/24.
//

import SwiftUI

struct ExchangeRateView: View {
    @StateObject private var viewModel = ExchangeRateViewModel()

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Exchange Rate for \(viewModel.assetBase)")
                    .font(.title3)
                    .fontWeight(.bold)
                    
                List(viewModel.rates) { rate in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(rate.asset_id_quote)
                                .font(.headline)
                            Text("Rate: \(rate.rate, specifier: "%.2f")")
                                .font(.subheadline)
                        }
                        Spacer()
                        Text("Last updated")
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .padding(.trailing, 10)
                    }
                }
                .listStyle(InsetGroupedListStyle())
//                .navigationTitle("Exchange Rates for \(viewModel.assetBase)")
                .onAppear {
                    Task {
                        await viewModel.fetchExchangeRates()
                    }
                }
            }
        }
    }
}

#Preview {
    ExchangeRateView()
}
