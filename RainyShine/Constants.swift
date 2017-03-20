//
//  Constants.swift
//  RainyShine
//
//  Created by Bettina on 3/19/17.
//  Copyright © 2017 Bettina Prophete. All rights reserved.
//

import Foundation

let baseURL = "http://api.openweathermap.org/data/2.5/"
let weather = "weather?"
let forecastDaily = "forecast/daily?"
let lat = "lat="
let lon = "&lon="
let count = "&cnt="
let appID = "&appid="
let apiKey = "ac32b168d8e184796ebca6a2f5ee8ee2" //to make it safer, should have apiKey in struct as static constant and added to .gitignore file

typealias DownloadComplete = () -> () // telling our function when we're complete and is a closure

let currentWeather_URL = "\(baseURL)\(weather)\(lat)40.71\(lon)-74.01\(appID)\(apiKey)"
let dailyWeather_URL = "\(baseURL)\(forecastDaily)\(lat)40.71\(lon)-74.01\(count)10\(appID)\(apiKey)"
// api.openweathermap.org/data/2.5/forecast/daily?lat={lat}&lon={lon}&cnt={cnt}

//extension Double {
//    mutating func kelvinToFarenheitConversion(temp: Double) -> Double {
//        let kelvinToFarenheitPreDiv = ((temp) * (9/5) - 459.67)
//        let kelvinToFarenheit = Double(round(10 * (kelvinToFarenheitPreDiv/10)))
//        
//        return kelvinToFarenheit
//        //self._currentTemp = kelvinToFarenheit
//    }
//}
