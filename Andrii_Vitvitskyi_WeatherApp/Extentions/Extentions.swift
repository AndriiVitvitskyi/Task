//
//  Extentions.swift
//  Andrii_Vitvitskyi_WeatherApp
//
//  Created by Mac on 11.03.18.
//  Copyright © 2018 Vitvitskyi. All rights reserved.
//

import Foundation

extension Double {
    func getTimeStringFromUTC() -> String {
        let date = Date(timeIntervalSince1970: self)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        dateFormatter.locale = Locale(identifier: "en_US")
        
        return dateFormatter.string(from: date)
    }
    
    func getDateAndTimeStringFromUTC() -> String {
        let date = Date(timeIntervalSince1970: self)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm MMM dd"
        dateFormatter.locale = Locale(identifier: "en_US")
        
        return dateFormatter.string(from: date)
    }
    
    func toCelsius() -> Int {
        let celsius = Int(self - 273.15)
        return celsius
    }
}
