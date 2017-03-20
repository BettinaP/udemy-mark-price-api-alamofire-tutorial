//
//  DailyWeatherCell.swift
//  RainyShine
//
//  Created by Bettina on 3/19/17.
//  Copyright © 2017 Bettina Prophete. All rights reserved.
//

import UIKit

class DailyWeatherCell: UITableViewCell {

    
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayOfWeekLabel: UILabel!
    @IBOutlet weak var dailyWeatherTypeLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(forecast: DailyForecast) {
        weatherIcon.image = UIImage(named: "\(forecast.weatherType)")
        dailyWeatherTypeLabel.text = forecast.weatherType
        maxTempLabel.text = "\(forecast.maxTemp)"
        minTempLabel.text = "\(forecast.minTemp)"
        dayOfWeekLabel.text = forecast.date
    }

}
