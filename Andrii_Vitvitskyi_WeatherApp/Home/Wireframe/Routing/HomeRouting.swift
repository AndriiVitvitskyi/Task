//
//  HomeRouting.swift
//  Andrii_Vitvitskyi_WeatherApp
//
//  Created by Mac on 08.03.18.
//  Copyright © 2018 Vitvitskyi. All rights reserved.
//

import Foundation

class HomeRouting: HomeRoutingProtocol {
    weak var viewController: HomeViewController!
    //MARK: Navigation // segueToAddNewCityVC
    func navigateToAddNewCity() {
        viewController.performSegue(withIdentifier: "segueToAddNewCityVC", sender: self)
    }
}
