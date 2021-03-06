//
//  CurrentWeather.swift
//  RainyShine
//
//  Created by Bettina on 3/19/17.
//  Copyright © 2017 Bettina Prophete. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class CurrentWeather {
    
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    var cityName: String {
        
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        
        return _date
    }
    
    
    var weatherType: String {
        if _weatherType == nil{
            _weatherType = ""
        }
        return _weatherType
    }

    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    
    func downloadCurrentWeatherDetails(completed: @escaping DownloadComplete) {
        // telling Alamofire where to download from
        
        let currentWeatherURL = URL(string: currentWeather_URL)!
        Alamofire.request(currentWeatherURL).responseJSON { response in
            let result = response.result
            
            if let dictionary = result.value as? Dictionary<String, AnyObject> {
                
                if let name = dictionary["name"] as? String {
                    self._cityName = name.capitalized
                    print(self._cityName)
                }
                
                if let weather = dictionary["weather"] as? [Dictionary<String, AnyObject>] {
                    if let mainWeatherType = weather[0]["main"] as? String {
                        self._weatherType = mainWeatherType.capitalized
                        print(self._weatherType)
                    }
                }
                
                if let main = dictionary["main"] as? Dictionary<String, AnyObject> {
                    if let mainTemp = main["temp"] as? Double {
                        //self._currentTemp = self.kelvinToFarenheitConversion(temp: mainTemp)
                        let kelvinToFarenheitPreDiv = (mainTemp * (9/5) - 459.67)
                        let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDiv/10))
                        self._currentTemp = kelvinToFarenheit
                    print(self._currentTemp)
                    }
                }
            }
            completed()
        }
        //removed completion handler because we already created our own closure that handles all the downloads: DownloadComplete
    }
}
