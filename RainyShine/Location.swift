//
//  Location.swift
//  RainyShine
//
//  Created by Bettina on 3/19/17.
//  Copyright © 2017 Bettina Prophete. All rights reserved.
//

import Foundation
import CoreLocation


class Location {
    
    static var  sharedInstance = Location() //accessible from anywhere in the app (global)
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}
