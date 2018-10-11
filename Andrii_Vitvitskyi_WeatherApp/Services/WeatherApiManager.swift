//
//  WeatherApiManager.swift
//  Andrii_Vitvitskyi_WeatherApp
//
//  Created by Mac on 08.03.18.
//  Copyright © 2018 Vitvitskyi. All rights reserved.
//

import Foundation
import Alamofire
import CoreLocation

class WeatherManager: WeatherApiManagerProtocol  {
    
    let api_Root = "http://api.openweathermap.org/data/2.5/weather?"
    let api_Root_Forecast = "https://api.openweathermap.org/data/2.5/forecast?"
    let api_key = "2f699687a5f6190427229e0febbcf678"
    
    func getWeatherFromCityName(coodrinate: CLLocationCoordinate2D, completion: @escaping (Result<Any?>) -> Void) {
        if let url = URL(string: "\(api_Root)lat=\(coodrinate.latitude)&lon=\(coodrinate.longitude)&APPID=\(api_key)")
        {
            Alamofire.request(url).responseJSON { (respone) in
                let jsonDictionary = respone.result.value as? [String: Any]
                let weatherModel = WeatherModel()
                weatherModel.fromJson(jsonDictionary!)
                completion(.success(weatherModel))
            }
        }
        
    }
    
    func getWeatherForFiveDaysByCityName(coordinate: CLLocationCoordinate2D, completion: @escaping (Result<Any?>) -> Void) {
        if let url = URL(string: "\(api_Root_Forecast)lat=\(coordinate.latitude)&lon=\(coordinate.longitude)&APPID=\(api_key)")
        {
            Alamofire.request(url).responseJSON { (response) in
                let jsonDictionary = response.result.value as? [String: Any]
                let list = jsonDictionary!["list"] as? [[String: Any]]
                var weatherModelFiveDays: [WeatherModelFiveDays] = []
                for list in list! {
                    let date = list["dt"] as! Double
                    let main = list["main"] as! [String: Any]
                    let humidity = main["humidity"] as! Int
                    let pressure = main["pressure"] as! Double
                    let temp = main["temp"] as! Double
                    let temp_max = main["temp_max"] as! Double
                    let temp_min = main["temp_min"] as! Double
 
                    let clouds = list["clouds"] as! [String: Any]
                    let cloudsAll = clouds["all"] as! Double
                    let weather = list["weather"] as! [[String: Any]]
                    let description = weather[0]["description"] as! String
                    weatherModelFiveDays.append(WeatherModelFiveDays(date: date, humidity: humidity, pressure: pressure, temp: temp, temp_max: temp_max, temp_min: temp_min, cloudsAll: cloudsAll, description: description))
                }
                completion(.success(weatherModelFiveDays))
            }
        }
        
    }
}
