//
//  CityWeatherDetailTableViewCell.swift
//  WeatherApp
//
//  Created by Nilesh Malviya on 3/28/21.
//

import UIKit

class CityWeatherDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
