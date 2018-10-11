//
//  HomeAssembly.swift
//  Andrii_Vitvitskyi_WeatherApp
//
//  Created by Mac on 08.03.18.
//  Copyright © 2018 Vitvitskyi. All rights reserved.
//

import Foundation

class HomeAssembly {
    
    private init() {
    }
    
    static let sharedInstance = HomeAssembly()
    
    func configure(_ viewController: HomeViewController)  {
        let apiDataManager = WeatherManager()
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouting()
        router.viewController =  viewController
        presenter.router = router
        viewController.presenter =  presenter
        presenter.interactor = interactor
        interactor.weatherApiManager = apiDataManager
        interactor.presenter = presenter
        presenter.view = viewController
    }
}
