# CoinExchangeApp

CoinExchangeApp is an iOS application that provides real-time exchange rate data for cryptocurrencies. The app is built using SwiftUI and utilizes the [CoinAPI](https://docs.coinapi.io/) to fetch live market data, making it easy to track cryptocurrency values against various fiat and crypto assets.

## Features

- **Real-Time Exchange Rates**: View the latest exchange rates for a variety of cryptocurrencies and fiat currencies.
- **Modern Design**: Crafted with SwiftUI for a clean, responsive, and visually appealing user experience.
- **Detailed Insights**: Drill down into specific cryptocurrencies and see their rates against multiple quote currencies.
- **Dynamic Updates**: Leveraging `async/await` to fetch and display live data seamlessly.

## Installation

1. **Clone the Repository**
   ```bash
   git clone https://github.com/abdiysf/CoinExchangeApp.git
   ```

2. **Set Up API Key**
   - Sign up for an account on [CoinAPI](https://www.coinapi.io/) to generate an API key.
   - Follow the API documentation [here](https://docs.coinapi.io/market-data/rest-api/exchange-rates) for detailed endpoint descriptions.
   - Open the project and add the API key:
     - Locate the `Config.xcconfig` file in the project directory (or create one if it doesn't exist).
     - Add the following line to the `Config.xcconfig` file:
       ```plaintext
       API_KEY = your_coinapi_key_here
       ```

3. **Open in Xcode**
   - Open the `CoinExchangeApp.xcodeproj` file in Xcode.

4. **Build and Run**
   - Select your target device or simulator.
   - Press `Cmd + R` to build and launch the app.

## Requirements

- Xcode 14 or later
- iOS 16 or later

## Usage

1. Launch the app on a compatible device or simulator.
2. Browse the list of cryptocurrencies and their exchange rates.
3. Select a specific currency to view its rates against multiple quotes.
4. Refresh the data to see real-time updates.

## Technologies Used

- **SwiftUI**: For a modern and dynamic user interface.
- **Networking**: Implements `URLSession` to fetch data from the CoinAPI.
- **Async/Await**: Ensures a smooth user experience with non-blocking data updates.
- **MVVM Architecture**: Maintains a clean and scalable codebase with a clear separation of concerns.

## API Integration

CoinExchangeApp integrates with the CoinAPI to fetch exchange rate data. The app uses the `/v1/exchangerate/{asset_id_base}` endpoint to retrieve the latest rates for a selected cryptocurrency.

For more information, visit the official [CoinAPI Documentation](https://docs.coinapi.io/).

---

Enjoy tracking cryptocurrency exchange rates with CoinExchangeApp! 🚀

--- 

Feel free to modify the details if you plan to include additional features or make updates!
