//
//  Constants.swift
//  RainyShine
//
//  Created by Bettina on 3/19/17.
//  Copyright © 2017 Bettina Prophete. All rights reserved.
//

import Foundation

let baseURL = "http://api.openweathermap.org/data/2.5/weather?"
let lat = "lat="
let lon = "&lon="
let appID = "&appid="
let apiKey = "ac32b168d8e184796ebca6a2f5ee8ee2"

let currentWeatherURL = "\(baseURL)\(lat)40.71\(lon)-74.01\(appID)\(apiKey)" 
