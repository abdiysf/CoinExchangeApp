//
//  Untitled.swift
//  CoinApp
//
//  Created by Abdirahman Standard on 27/11/24.
//

import Foundation

class ExchangeRateViewModel: ObservableObject {
    @Published var rates: [ExchangeRate] = []
    @Published var assetBase: String = "BTC"

    private let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String

    func fetchExchangeRates() async {
        guard let apiKey = apiKey else {
            print("API Key missing.")
            return
        }

        let urlString = "https://rest.coinapi.io/v1/exchangerate/\(assetBase)"
        guard let url = URL(string: urlString) else {
            print("Invalid URL.")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("text/plain", forHTTPHeaderField: "Accept")
        request.addValue(apiKey, forHTTPHeaderField: "X-CoinAPI-Key")

        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Invalid response: \(response)")
                return
            }

            let decodedResponse = try JSONDecoder().decode(ExchangeRateResponse.self, from: data)
            DispatchQueue.main.async {
                self.rates = decodedResponse.rates
            }
        } catch {
            print("Error fetching exchange rates: \(error.localizedDescription)")
        }
    }
}
