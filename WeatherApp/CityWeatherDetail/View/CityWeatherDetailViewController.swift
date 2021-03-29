//
//  CityWeatherDetailViewController.swift
//  WeatherApp
//
//  Created by Nilesh Malviya on 3/28/21.
//

import UIKit

class CityWeatherDetailViewController: UIViewController {
    
    var weatherDetails: WeatherResponse?
    var dataDictionary: [String : Double] = [:]
    var titleArray: [String] = []
    @IBOutlet weak var weatherTableView: UITableView!
    var presenter: CityWeatherViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleArray.append(contentsOf: dataDictionary.keys)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: weatherDetails?.city?.name, style: .plain, target: self, action: #selector(handleBack))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        weatherTableView.reloadData()
    }
    
    /// Handle back button action
    @objc func handleBack() {
        navigationController?.popViewController(animated: true)
    }
}

extension CityWeatherDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherDetails?.list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableSetting().cellIdentifier) as! CityWeatherDetailTableViewCell
        cell.tempLabel.text = String(weatherDetails?.list?[indexPath.row].main?.temp ?? 0.0)
        cell.conditionLabel.text = weatherDetails?.list?[indexPath.row].weather?[0].main
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let weatherDetails = weatherDetails?.list?[indexPath.row] else {
            return
        }
        presenter?.router?.pushNewView(weatherDetails: weatherDetails, navigationController: navigationController)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TableSetting().rowHeight
    }
}

