//
//  HomeRouter.swift
//  WeatherApp
//
//  Created by Nilesh Malviya on 3/28/21.
//

import UIKit

/// Class to handle routing 
class HomeRouter: PresenterToRouterProtocol {
    
    /// Method to load the Home View
    /// - Returns : UIViewController
    func loadHomeView() -> UIViewController {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let homeVC = storyBoard.instantiateViewController(identifier: ClassIdentifier().homeVC) as! HomeViewController
        
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = HomePresenter()
        let interactor: PresenterToInteractorProtocol = HomeInteractor()
        let router: PresenterToRouterProtocol = HomeRouter()
        
        presenter.view = homeVC
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        homeVC.presenter = presenter
        return homeVC
    }
    
    /// Method to load the new view
    /// - Parameters : weatherDetails - Weather details
    /// - Parameters : navigationController - Navigation Controller
    func pushNewView(weatherDetails: WeatherResponse, navigationController: UINavigationController?) {
        let cityWeatherDetailVC = CityWeatherDetailRouter().loadCityWeatherDetailView()
        cityWeatherDetailVC.weatherDetails = weatherDetails
        navigationController?.pushViewController(cityWeatherDetailVC, animated: true)
    }
}

