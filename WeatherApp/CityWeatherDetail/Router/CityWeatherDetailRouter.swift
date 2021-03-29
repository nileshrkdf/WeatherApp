//
//  CityWeatherDetailRouter.swift
//  WeatherApp
//
//  Created by Nilesh Malviya on 3/28/21.
//

import UIKit

/// Class to handle routing 
class CityWeatherDetailRouter: CityWeatherPresenterToRouterProtocol {
    
    /// Methos to load the Home View
    /// - Returns : UIViewController
    func loadCityWeatherDetailView() -> CityWeatherDetailViewController {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let citWeatherDetailVC = storyBoard.instantiateViewController(identifier: ClassIdentifier().cityWeatherDetailsVC) as! CityWeatherDetailViewController
        
        let presenter: CityWeatherViewToPresenterProtocol = CityWeatherDetailPresenter()
        let router: CityWeatherPresenterToRouterProtocol = CityWeatherDetailRouter()

        presenter.router = router
        citWeatherDetailVC.presenter = presenter
        return citWeatherDetailVC
    }
    
    /// Method to load the new view
    /// - Parameters : weatherDetails - Weather details
    /// - Parameters : navigationController - Navigation Controller
    func pushNewView(weatherDetails weather: Weathers, navigationController: UINavigationController?) {
        let cityWeatherDeepDive = CityWeatherDeepDiveRouter().loadCityWeatherDeepDiveView()
        cityWeatherDeepDive.weatherDetails = weather
        navigationController?.pushViewController(cityWeatherDeepDive, animated: true)
    }
}
