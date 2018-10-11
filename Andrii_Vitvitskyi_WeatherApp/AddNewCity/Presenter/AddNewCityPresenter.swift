//
//  AddNewSityPresenter.swift
//  Andrii_Vitvitskyi_WeatherApp
//
//  Created by Mac on 08.03.18.
//  Copyright © 2018 Vitvitskyi. All rights reserved.
//

import Foundation

class AddNewCityPresenter: AddNewCityPresenterProtocol {
    
    var router: AddNewCityRoutingProtocol!
    //Push to Home VC
    func pushToHomeVCPresenter() {
        self.router.presentHomeVC()
    }
}
