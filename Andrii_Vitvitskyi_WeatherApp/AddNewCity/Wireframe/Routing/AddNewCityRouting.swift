//
//  AddNewCityRouting.swift
//  Andrii_Vitvitskyi_WeatherApp
//
//  Created by Mac on 09.03.18.
//  Copyright © 2018 Vitvitskyi. All rights reserved.
//

import UIKit

class AddNewCityRouting: AddNewCityRoutingProtocol  {
    
    //MARK: Present Home VC
    weak var viewController: UINavigationController!
    func presentHomeVC() {
        viewController.popViewController(animated: true)
    }

}
