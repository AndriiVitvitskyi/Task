//
//  WeatherModel.swift
//  Andrii_Vitvitskyi_WeatherApp
//
//  Created by Mac on 08.03.18.
//  Copyright © 2018 Vitvitskyi. All rights reserved.
//

import Foundation

final class WeatherModel {
    var sityName: String!
    var humidity: Int!
    var pressure: Int!
    var temp: Double!
    var temp_max: Double!
    var temp_min: Double!
    var description: String!
    var clouds: Int!
    var sunrise: Double!
    var sunset: Double!
    var windDeg: Double!
    var windGust: Double!
    var windSpeed: Double!

    func fromJson(_ json: [String: Any]) {
        guard let main = json["main"] as? [String: Any] else { return }
        humidity = main["humidity"] as? Int
        pressure = main["pressure"] as? Int
        temp = main["temp"] as? Double
        temp_max = main["temp_max"] as? Double
        temp_min = main["temp_min"] as? Double
        sityName = json["name"] as? String
        let weatherAll = json["weather"] as? NSArray
        let weather = weatherAll![0] as? [String: Any]
        description = weather!["description"] as? String
        let cloud = json["clouds"] as? [String: Any]
        clouds = cloud!["all"] as? Int
        let sys = json["sys"] as? [String: Any]
        sunrise = sys!["sunrise"] as? Double
        sunset = sys!["sunset"] as? Double
        let wind = json["wind"] as? [String: Any]
        windDeg = wind!["windDeg"] as? Double
        windGust = wind!["windGust"] as? Double
        windSpeed = wind!["windSpeed"] as? Double
    }
}

final class WeatherModelFiveDays {
    
    var date: Double?
    var humidity: Int?
    var pressure: Double?
    var temp: Double?
    var temp_max: Double?
    var temp_min: Double?
    var cloudsAll: Double?
    var description: String?
    
    init(date: Double, humidity: Int, pressure: Double, temp: Double, temp_max: Double, temp_min: Double, cloudsAll: Double, description: String) {
        self.date = date
        self.humidity = humidity
        self.pressure = pressure
        self.temp = temp
        self.temp_min = temp_min
        self.temp_max = temp_max
        self.cloudsAll = cloudsAll
        self.description = description
    }
}
