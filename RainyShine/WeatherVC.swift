//
//  WeatherVC.swift
//  RainyShine
//
//  Created by Bettina on 3/18/17.
//  Copyright © 2017 Bettina Prophete. All rights reserved.
//

import UIKit
import Alamofire

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
   
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherTypeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var currentWeather: CurrentWeather!
    var dailyForecast: DailyForecast!
    var forecasts = [DailyForecast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        currentWeather = CurrentWeather()
        
        //dailyForecast = DailyForecast(weatherDict:)
        currentWeather.downloadCurrentWeatherDetails {
            self.downloadDailyForecastDetails {
                self.updateMainUI()
                self.tableView.reloadData()
            }
        }
        
        
    }
    
    func downloadDailyForecastDetails(completed: @escaping DownloadComplete) {
        let dailyForecastURL = URL(string: dailyWeather_URL)!
        Alamofire.request(dailyForecastURL).responseJSON { (response) in
            let result = response.result
            
            if let dictionary = result.value as? Dictionary<String, AnyObject> {
                
                if let list = dictionary["list"] as? [Dictionary<String, AnyObject>] {
                    
                    //for everyday in the list, passing to array of dictionaries called forecasts for our 10-day forecast.
                    for day in list {
                        let forecast = DailyForecast(weatherDict: day)
                        self.forecasts.append(forecast)
                        print(day)
                    }
                    self.forecasts.remove(at: 0)
                    self.tableView.reloadData()

                }
            }
         completed()
        }
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier:"weatherCell", for: indexPath) as? DailyWeatherCell {
            
            let dayForecast = forecasts[indexPath.row]
            cell.configureCell(forecast: dayForecast)
            
            return cell
        }
        
        return DailyWeatherCell()
    }

    func updateMainUI() {
        dateLabel.text = currentWeather.date
        currentTempLabel.text = "\(currentWeather.currentTemp)"
        currentWeatherTypeLabel.text = currentWeather.weatherType
        locationLabel.text = currentWeather.cityName
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
    }

}

