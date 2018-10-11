//
//  HomeInteractorProtocol.swift
//  Andrii_Vitvitskyi_WeatherApp
//
//  Created by Mac on 08.03.18.
//  Copyright © 2018 Vitvitskyi. All rights reserved.
//

import Foundation
import CoreLocation

protocol HomeInteractorProtocolInput: class {
    func getInfoFromWeatherApi(coordinate: CLLocationCoordinate2D)
    func getInfoFromweatherApiFiveDays(coordinate: CLLocationCoordinate2D)
}

protocol HomeInteractorProtocolOutput: class {
    func setWeatherFromCity(_ info: WeatherModel)
    func setWeatherFiveDaysByCitytName(_ info: [WeatherModelFiveDays])
    
}
