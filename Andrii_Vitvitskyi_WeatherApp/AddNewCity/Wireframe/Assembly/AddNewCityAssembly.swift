//
//  AddNewCityAssembly.swift
//  Andrii_Vitvitskyi_WeatherApp
//
//  Created by Mac on 08.03.18.
//  Copyright © 2018 Vitvitskyi. All rights reserved.
//

import Foundation
import UIKit

class AddNewCityAssembly {
    private init() {
    }
    
    static let sharedInstance = AddNewCityAssembly()
    
    func configure(_ viewController: AddNewCityViewController, navVC: UINavigationController)  {
        let router =  AddNewCityRouting()
        let presenter = AddNewCityPresenter()
        router.viewController = navVC
        presenter.router = router
        viewController.presenter =  presenter
        
    }
}
