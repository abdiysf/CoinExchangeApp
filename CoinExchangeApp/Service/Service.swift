//
//  Service.swift
//  CoinApp
//
//  Created by Abdirahman Standard on 27/11/24.
//

import Foundation

struct Service {
    private let apiKey: String? = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func fetchExchangeRates(for assetBase: String = "USD") async {
        // Ensure the API key is available
        guard let apiKey = apiKey else {
            print("Error: API key is missing.")
            return
        }
        
        // Construct the endpoint URL
        guard let endPoint = URL(string: "https://rest.coinapi.io/v1/exchangerate/\(assetBase)") else {
            print("Error: Invalid URL.")
            return
        }
        
        var request = URLRequest(url: endPoint)
        request.httpMethod = "GET"
        request.addValue("text/plain", forHTTPHeaderField: "Accept")
        request.addValue(apiKey, forHTTPHeaderField: "X-CoinAPI-Key")
        
        do {
            // Perform the network request
            let (data, response) = try await URLSession.shared.data(for: request)
            
            print("---- \(response)")
            // Check the HTTP response status
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                // Decode the response data (optional: use a custom model)
                let responseText = String(data: data, encoding: .utf8) ?? "Unable to parse response"
                print("Response Text: \(responseText)")
                
                // Optional: Decode into a model if needed
                // let decoder = JSONDecoder()
                // let exchangeRates = try decoder.decode(ExchangeRates.self, from: data)
                // print(exchangeRates)
            } else {
                print("Error: Invalid response from server.")
            }
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}

