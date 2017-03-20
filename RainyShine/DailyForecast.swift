//
//  DailyForecast.swift
//  RainyShine
//
//  Created by Bettina on 3/19/17.
//  Copyright © 2017 Bettina Prophete. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class DailyForecast {
    //data encapsulation
    var _date: String!
    var _weatherType: String!
    var _maxTemp: Double!
    var _minTemp: Double!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var maxTemp: Double {
        if _maxTemp == nil {
            _maxTemp = 0.0
        }
        return _maxTemp
    }
    
    var minTemp: Double {
        if _minTemp == nil {
            _minTemp = 0.0
        }
        return _minTemp
    }
    
    
    init(weatherDict: Dictionary<String, AnyObject>) {
        
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            if let min = temp["min"] as? Double {
                let kelvinToFarenheitPreDiv = (min * (9/5) - 459.67)
                let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDiv/10))
                self._minTemp = kelvinToFarenheit

            }
            
            if let max = temp["max"] as? Double {
                let kelvinToFarenheitPreDiv = (max * (9/5) - 459.67)
                let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDiv/10))
                self._maxTemp = kelvinToFarenheit
            }
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            if let mainWeatherType = weather[0]["main"] as? String {
                self._weatherType = mainWeatherType
            }
        }
        
        if let date = weatherDict["dt"] as? Double {
            //format date into string
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            
            self._date = unixConvertedDate.dayOfTheWeek()
            print(self._date)
            
        }
    }
}

extension Date {

    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }

}
