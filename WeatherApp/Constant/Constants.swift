//
//  Constants.swift
//  WeatherApp
//
//  Created by Nilesh Malviya on 3/28/21.
//

import UIKit

/// Class Identifiers
struct ClassIdentifier {
    let homeVC = "homeVC"
    let cityWeatherDetailsVC = "cityWeatherDetailVC"
    let cityWeatherDeepDiveVC = "cityWeatherDeepDiveVC"
}

/// Look up button details
struct LookUpButtonDetails {
    let borderWidth: CGFloat = 1.0
    let cornerRadius: CGFloat = 5.0
    let borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1).cgColor
}

/// Constant
struct Constants {
    let apiKey = "65d00499677e59496ca2f318eb68c049"
    let queryComponent = "&appid="
    let alertErrorTitle = "Error"
    let alertMessageForNoCity = "Please enter city name"
    let alertMessageForNoResponse = "No forecast found for this city"
    let alertOk = "Ok"
}

/// Base url  constants
struct BaseURLConstants {
    let forcastURL = "https://api.openweathermap.org/data/2.5/forecast?q="
}

/// Table setting details
struct TableSetting {
    let rowHeight: CGFloat = 80.0
    let cellIdentifier: String = "cityWeatherDetail"
    let backImageName: String = "backButton"
}
