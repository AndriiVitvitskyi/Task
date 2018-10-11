//
//  HomePresenter.swift
//  Andrii_Vitvitskyi_WeatherApp
//
//  Created by Mac on 08.03.18.
//  Copyright © 2018 Vitvitskyi. All rights reserved.
//

import Foundation
import CoreLocation

class HomePresenter: HomePresenterProtocol {
    
    var isCurrentLocation: Bool = true
    var interactor: HomeInteractorProtocolInput!
    weak var view: HomeViewControllerProtocolInput!
    var router: HomeRoutingProtocol!
    
    func getInfoFromIteractor(coordinate: CLLocationCoordinate2D) {
        interactor.getInfoFromWeatherApi(coordinate: coordinate)
    }


    func getInfoFromIteractorForFiveDays(coordinate: CLLocationCoordinate2D) {
        interactor.getInfoFromweatherApiFiveDays(coordinate: coordinate)
    }

    func setWeatherFromCity(_ info: WeatherModel) {
        self.view.setWeatherFromCity(info)
    }

    func setWeatherFiveDaysByCitytName(_ info: [WeatherModelFiveDays]) {
        self.view.setWeatherFiveDaysByCitytName(info)
    }
    
    func pushToAddNewCity() {
        self.router.navigateToAddNewCity()
    }
}
