//
//  ViewController.swift
//  WeatherApp
//
//  Created by Nilesh Malviya on 3/28/21.
//

import UIKit

class HomeViewController: UIViewController, PresenterToViewProtocol  {

    @IBOutlet weak var cityLabel: UITextField!
    @IBOutlet weak var lookUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        lookUpButton.layer.borderWidth = LookUpButtonDetails().borderWidth
        lookUpButton.layer.borderColor = LookUpButtonDetails().borderColor
        lookUpButton.layer.cornerRadius = LookUpButtonDetails().cornerRadius
        initialSetup()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    /// Handle back button action
    @objc func handleBack() {
        navigationController?.popViewController(animated: true)
    }
    
    /// Setup initial data
    func initialSetup() {
        let backImage = UIImage(named: TableSetting().backImageName)
        navigationController?.navigationBar.backIndicatorImage = backImage
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationItem.backBarButtonItem = UIBarButtonItem(title: cityLabel.text, style: .plain, target: self, action: #selector(handleBack))
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
    }
    
    // MARK:- PresenterToViewProtocol Properties & Method
    var presenter: ViewToPresenterProtocol?
    
    /// Method to notify view when data is received
    /// - Parameters: data - Weather Response
    /// - Parameters: error - ErrorType
    func viewNotificationFromPresenter(data: WeatherResponse?, error: ErrorType?) {
        DispatchQueue.main.async {
            if let data = data, error == nil {
                self.navigationItem.backBarButtonItem = UIBarButtonItem(title: data.city?.name, style: .plain, target: nil, action: nil)
                self.presenter?.router?.pushNewView(weatherDetails: data, navigationController: self.navigationController)
            } else {
                /// Alert
                let alertView = UIAlertController.init(title: Constants().alertErrorTitle, message: Constants().alertMessageForNoResponse, preferredStyle: .alert)
                alertView.addAction(UIAlertAction(title: Constants().alertOk, style: .cancel, handler: nil))
                self.present(alertView, animated: true, completion: nil)
            }
        }
    }
    
    /// Method to handle look up button action
    @IBAction func lookUpButtonPressed(_ sender: Any) {
        if let city = cityLabel.text, city != "" {
            presenter?.presenterNotificationFromViewToGetData(cityName: city)
        } else {
            /// Alert
            let alertView = UIAlertController.init(title: Constants().alertErrorTitle, message: Constants().alertMessageForNoCity, preferredStyle: .alert)
            alertView.addAction(UIAlertAction(title: Constants().alertOk, style: .cancel, handler: nil))
            self.present(alertView, animated: true, completion: nil)
        }
    }
}

