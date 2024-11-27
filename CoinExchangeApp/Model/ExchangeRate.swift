//
//  ExchangeRate.swift
//  CoinApp
//
//  Created by Abdirahman Standard on 27/11/24.
//

import Foundation

struct ExchangeRateResponse: Codable {
    let asset_id_base: String
    let rates: [ExchangeRate]
}

struct ExchangeRate: Codable, Identifiable {
    let id = UUID()
    let time: String
    let asset_id_quote: String
    let rate: Double
}
