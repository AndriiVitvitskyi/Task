//
//  WeatherApiManagerProtocol.swift
//  Andrii_Vitvitskyi_WeatherApp
//
//  Created by Mac on 08.03.18.
//  Copyright © 2018 Vitvitskyi. All rights reserved.
//

import Foundation
import Alamofire
import CoreLocation

protocol WeatherApiManagerProtocol: class {
    func getWeatherFromCityName(coodrinate: CLLocationCoordinate2D, completion: @escaping (Result<Any?>) -> Void)
    func getWeatherForFiveDaysByCityName(coordinate: CLLocationCoordinate2D, completion: @escaping (Result<Any?>) -> Void)
}
