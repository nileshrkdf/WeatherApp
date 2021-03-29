//
//  CityWeatherDetailProtocol.swift
//  WeatherApp
//
//  Created by Nilesh Malviya on 3/28/21.
//

import UIKit

/// Protocol to handle the View To Presenter Protocol
protocol CityWeatherViewToPresenterProtocol: AnyObject  {
    var router: CityWeatherPresenterToRouterProtocol? {get set}
}

/// Protocol to handle the Presenter To View Protocol
protocol CityWeatherPresenterToViewProtocol: AnyObject {
     var presenter: CityWeatherViewToPresenterProtocol? { get set }
}

/// Protocol to handle the Presenter To Router Protocol
protocol CityWeatherPresenterToRouterProtocol: AnyObject {
    
    /// Method to load the new view
    /// - Parameters : weatherDetails - Weather details
    /// - Parameters : navigationController - Navigation Controller
    func pushNewView(weatherDetails: Weathers, navigationController: UINavigationController?)
}

