//
//  HomeInteractor.swift
//  Andrii_Vitvitskyi_WeatherApp
//
//  Created by Mac on 08.03.18.
//  Copyright © 2018 Vitvitskyi. All rights reserved.
//

import Foundation
import CoreLocation

class HomeInteractor: HomeInteractorProtocolInput {
    
    var weatherApiManager: WeatherApiManagerProtocol!
    
    weak var presenter: HomeInteractorProtocolOutput!
    
    func getInfoFromWeatherApi(coordinate: CLLocationCoordinate2D)  {
        weatherApiManager.getWeatherFromCityName(coodrinate: coordinate) {  [weak self] result in
            if case .failure(let error) = result {
                print(error)
            }
            if case .success(let model)  = result {
                guard let weather: WeatherModel = model as? WeatherModel else { return }
                weather.temp = weather.temp - 273.15
                self?.presenter.setWeatherFromCity(weather)
            }
        }
    }

    func getInfoFromweatherApiFiveDays(coordinate: CLLocationCoordinate2D) {
        weatherApiManager.getWeatherForFiveDaysByCityName(coordinate: coordinate) { [weak self] result in
            if case .failure(let error) = result {
                print(error)
            }
            if case .success(let model)  = result {
                let weather: [WeatherModelFiveDays] = model as! [WeatherModelFiveDays]
                self?.presenter.setWeatherFiveDaysByCitytName(weather)
            }
        }
    }
}
