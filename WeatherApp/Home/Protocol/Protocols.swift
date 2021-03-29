//
//  Protocols.swift
//  WeatherApp
//
//  Created by Nilesh Malviya on 3/28/21.
//

import UIKit

/// Protocol to handle the View To Presenter Protocol
protocol ViewToPresenterProtocol: AnyObject  {
    var view: PresenterToViewProtocol? { get set }
    var interactor: PresenterToInteractorProtocol? { get set }
    var router: PresenterToRouterProtocol? {get set}
    
    /// Method to notify presenter to get data
    /// - Parameters: cityName - city name
    func presenterNotificationFromViewToGetData(cityName: String)
}

/// Protocol to handle the Presenter To View Protocol
protocol PresenterToViewProtocol: AnyObject {
     var presenter: ViewToPresenterProtocol? { get set }
    
    /// Method to notify view when data is received
    /// - Parameters: data - Weather Response
    /// - Parameters: error - ErrorType
    func viewNotificationFromPresenter(data: WeatherResponse?, error: ErrorType?)
}

/// Protocol to handle the Interactor To Presenter Protocol
protocol InteractorToPresenterProtocol: AnyObject  {
    
    /// Method to notify presenter when data is received
    /// - Parameters: data - Weather Response
    /// - Parameters: error - ErrorType
    func presenterNotificationFromInteractor(data: WeatherResponse?, error: ErrorType?)
}

/// Protocol to handle the Presenter To Interactor Protocol
protocol PresenterToInteractorProtocol: AnyObject  {
    var presenter: InteractorToPresenterProtocol? { get set }
    
    /// Method to nofity interactor to fetch data
    /// - Parameters: cityName - city name
    func interactorNotificationFromPresenterToFetchData(cityName: String)
}

/// Protocol to handle the Presenter To Router Protocol
protocol PresenterToRouterProtocol: AnyObject {
    
    /// Method to load the new view
    /// - Parameters : weatherDetails - Weather details
    /// - Parameters : navigationController - Navigation Controller
    func pushNewView(weatherDetails: WeatherResponse, navigationController: UINavigationController?)
}
