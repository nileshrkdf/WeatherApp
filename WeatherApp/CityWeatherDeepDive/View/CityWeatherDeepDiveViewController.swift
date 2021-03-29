//
//  CityWeatherDeepDiveViewController.swift
//  WeatherApp
//
//  Created by Nilesh Malviya on 3/28/21.
//

import UIKit

class CityWeatherDeepDiveViewController: UIViewController {

    var weatherDetails: Weathers?
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var tempMainLabel: UILabel!
    @IBOutlet weak var temperatureDescriptionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialData()
    }
    
    /// Method to set initial Data
    func setInitialData() {
        temperatureLabel.text = String(weatherDetails?.main?.temp ?? 0.0)
        feelsLikeLabel.text = String(weatherDetails?.main?.feels_like ?? 0.0)
        tempMainLabel.text = weatherDetails?.weather?[0].main
        temperatureDescriptionLabel.text = weatherDetails?.weather?[0].description
    }
}
