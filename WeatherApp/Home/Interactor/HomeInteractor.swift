//
//  HomeInteractor.swift
//  WeatherApp
//
//  Created by Nilesh Malviya on 3/28/21.
//

import Foundation

/// Interactor Class
class HomeInteractor: PresenterToInteractorProtocol {
    
    var weatherDetails: WeatherResponse?
    
    /// Method to fetch weather data
    /// - Parameters: cityName - city
    func getData(cityName: String) {
        NetworkConnector().fetchWeatherData(cityName: cityName, completion: { [weak self](weathers, error) in
            guard let self = self else { return }
            if error == nil {
                if let weather = weathers {
                    self.weatherDetails = weather
                    self.presenter?.presenterNotificationFromInteractor(data: self.weatherDetails, error: nil)
                } else {
                    /// Need to show alert
                    self.presenter?.presenterNotificationFromInteractor(data: nil, error: .connectionIssue)
                }
            } else {
                /// Need to show alert
                self.presenter?.presenterNotificationFromInteractor(data: nil, error: error)
            }
        })
    }
    
    // MARK:- PresenterToInteractorProtocol Properties & Method
    weak var presenter: InteractorToPresenterProtocol?
    
    /// Method to nofity interactor to fetch data
    /// - Parameters: cityName - city name
    func interactorNotificationFromPresenterToFetchData(cityName: String) {
        getData(cityName: cityName)
    }
    
    /// Method to return weather response
    /// - Returns : WeatherResponse - response data
    func getWeatherDetails() ->  WeatherResponse? {
        return weatherDetails
    }
}
