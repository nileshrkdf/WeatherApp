//
//  NetworkConnector.swift
//  WeatherApp
//
//  Created by Nilesh Malviya on 3/28/21.
//

import Foundation

/// Network connector class
class NetworkConnector {
    
    /// Method to fetch data
    /// - Parameters: cityName - city name
    /// - Parameters: completion - completion closure
    func fetchWeatherData(cityName: String, completion: @escaping (WeatherResponse?, ErrorType?) -> Void) {
        let urlString = BaseURLConstants().forcastURL + cityName + Constants().queryComponent + Constants().apiKey
        if let url = URL.init(string: urlString) {
            ConnectionManager().makeRequest(url: url, methodType: .get, completion: { (data, error) in
                if error == nil {
                    if let data = data {
                        do {
                            let data = try JSONDecoder().decode(WeatherResponse.self, from: data)
                            completion(data, nil)
                        } catch {
                            completion(nil, .badJSON)
                        }
                    } else {
                        completion(nil, .genericError)
                    }
                } else {
                    completion(nil, .connectionIssue)
                }
            })
        } else {
            completion(nil, .invalidURL)
        }
    }
}
