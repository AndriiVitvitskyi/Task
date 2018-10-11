//
//  CityModels.swift
//  Andrii_Vitvitskyi_WeatherApp
//
//  Created by Mac on 11.03.18.
//  Copyright © 2018 Vitvitskyi. All rights reserved.
//

import Foundation
import CoreLocation

class CityModel {
    var name: String?
    var coordinate: CLLocationCoordinate2D?
    
    init(name: String, coordinate: CLLocationCoordinate2D) {
        self.name = name
        self.coordinate = coordinate
    }
    
}
