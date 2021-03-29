//
//  CityWeatherDeepDiveRouter.swift
//  WeatherApp
//
//  Created by Nilesh Malviya on 3/28/21.
//


import UIKit

class CityWeatherDeepDiveRouter {
   
    /// Methos to load the Home View
    /// - Returns : UIViewController
    func loadCityWeatherDeepDiveView() -> CityWeatherDeepDiveViewController {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let citWeatherDeepDiveVC = storyBoard.instantiateViewController(identifier: ClassIdentifier().cityWeatherDeepDiveVC) as! CityWeatherDeepDiveViewController
        return citWeatherDeepDiveVC
    }
}
