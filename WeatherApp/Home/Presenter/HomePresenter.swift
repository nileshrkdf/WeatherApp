//
//  HomePresenter.swift
//  WeatherApp
//
//  Created by Nilesh Malviya on 3/28/21.
//

import UIKit

class HomePresenter: ViewToPresenterProtocol, InteractorToPresenterProtocol {
    
    //MARK:- ViewToPresenterProtocol Properties & Method
    weak var view: PresenterToViewProtocol?
    var interactor: PresenterToInteractorProtocol?
    var router: PresenterToRouterProtocol?

    func presenterNotificationFromViewToGetData(cityName: String) {
        interactor?.interactorNotificationFromPresenterToFetchData(cityName: cityName)
    }
    
    //MARK:- InteractorToPresenterProtocol Properties & Method
    func presenterNotificationFromInteractor(data: WeatherResponse?, error: ErrorType?) {
        view?.viewNotificationFromPresenter(data: data, error: error)
    }
    
}
