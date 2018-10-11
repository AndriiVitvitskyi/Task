//
//  HomeViewControllerProtocol.swift
//  Andrii_Vitvitskyi_WeatherApp
//
//  Created by Mac on 08.03.18.
//  Copyright © 2018 Vitvitskyi. All rights reserved.
//

import Foundation
import CoreLocation

protocol HomeViewControllerProtocolOutput: class {
    func getInfoFromIteractor(coordinate: CLLocationCoordinate2D)
    func getInfoFromIteractorForFiveDays(coordinate: CLLocationCoordinate2D)
    func pushToAddNewCity()
}

protocol HomeViewControllerProtocolInput: class {
    func setWeatherFromCity(_ info: WeatherModel)
    func setWeatherFiveDaysByCitytName(_ info: [WeatherModelFiveDays])
    func weatherFromAddNewCity(coordinate: CLLocationCoordinate2D, cityName: String)
}
