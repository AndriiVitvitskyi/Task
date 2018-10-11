
//
//  ViewController.swift
//  Andrii_Vitvitskyi_WeatherApp
//
//  Created by Mac on 08.03.18.
//  Copyright © 2018 Vitvitskyi. All rights reserved.
//

import UIKit
import CoreLocation

class HomeViewController: UIViewController, HomeViewControllerProtocolInput {
    
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var cityName: UILabel!
    @IBOutlet private weak var tempLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: HomePresenterProtocol!
    
    private let locationManager = CLLocationManager()
    
    private var currentCity: [CityModel] = []
    private var weatherInCurrentLocation: WeatherModel?
    private var weatherArray: [WeatherModelFiveDays] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        HomeAssembly.sharedInstance.configure(self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCurrantLocation()
        navigatinBarSettings()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func navigatinBarSettings() {
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.backgroundColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
    
    func weatherFromAddNewCity(coordinate: CLLocationCoordinate2D, cityName: String) {
        presenter.getInfoFromIteractor(coordinate: coordinate)
        presenter.getInfoFromIteractorForFiveDays(coordinate: coordinate)
        self.cityName.text = cityName
    }
    
    func getWetharFromCityName(coorinate: CLLocationCoordinate2D) {
        print(presenter.getInfoFromIteractor(coordinate: coorinate))
    }
    
    func getWetharFromCityNameFiveDays(coordinate: CLLocationCoordinate2D) {
        print(presenter.getInfoFromIteractorForFiveDays(coordinate: coordinate))
    }
    
    func setWeatherFiveDaysByCitytName(_ info: [WeatherModelFiveDays]) {
        weatherArray = info
        collectionView.reloadData()
    }

    func setWeatherFromCity(_ info: WeatherModel) {
        self.label.text = "\(info.description!)"
        self.tempLabel.text = "\(Int(info.temp!))°"
        self.weatherInCurrentLocation = info
        self.tableView.reloadData()
    }
    
    private func getCurrantLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func setView(city: String) {
        self.cityName.text = city
    }
    
    @IBAction func citySettings(_ sender: Any) {
        self.presenter.pushToAddNewCity()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToAddNewCityVC"
        {
            if let destinationVC = segue.destination as? AddNewCityViewController {
                destinationVC.homeVC = self
                destinationVC.city.append(currentCity[0])
            }
        }
    }
    
}

extension HomeViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let geoCoder = CLGeocoder()
        self.getWetharFromCityName(coorinate: location.coordinate)
        self.getWetharFromCityNameFiveDays(coordinate: location.coordinate)
        geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
            
            // Place details
            var placeMark: CLPlacemark!
            placeMark = placemarks?[0]
            guard let address = placeMark.subAdministrativeArea else { return }
            self.currentCity.append(CityModel(name: address, coordinate: location.coordinate))
            self.locationManager.stopUpdatingLocation()
            
            self.setView(city: address)
        })
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: 100, height: 150);
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeColectionViewCell", for: indexPath) as? HomeCollectionViewCell else {
            return UICollectionViewCell() }
        if let date = weatherArray[indexPath.row].date?.getDateAndTimeStringFromUTC() {
            cell.dateLabel.text = "\(String(describing: date))"
        }
        cell.weatherLabel.text = weatherArray[indexPath.row].description
        if let temp = weatherArray[indexPath.row].temp?.toCelsius() {
        cell.tempLabel.text = "\(String(describing: temp))°"
        }
        return cell
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailsWeaatherCell") as? HomeWeatherDetailsTableViewCell else { return UITableViewCell() }
        switch indexPath.row {
        case 0:
            cell.firstTitle.text = "SUNRISE"
            if let sunerise = (weatherInCurrentLocation?.sunrise)?.getTimeStringFromUTC() {
                cell.firstValue.text = "\(String(describing: sunerise))"
            }
            cell.secondTitle.text = "SUNSET"
            if let suneset = (weatherInCurrentLocation?.sunset)?.getTimeStringFromUTC() {
                cell.secondValue.text = "\(String(describing: suneset))"
            }
        case 1:
            cell.firstTitle.text = "CLOUDS"
            if let clouds = weatherInCurrentLocation?.clouds {
                cell.firstValue.text = "\(String(describing: clouds))%"
            }
            cell.secondTitle.text = "HUMIDITY"
            if let humidity = weatherInCurrentLocation?.humidity {
                cell.secondValue.text = "\(String(describing: humidity))%"
            }
        case 2:
            cell.firstTitle.text = "TEMP MAX"
            if let temp = weatherInCurrentLocation?.temp_max.toCelsius() {
                cell.firstValue.text = "\(String(describing: temp))°"
            }
            cell.secondTitle.text = "TEMP MIN"
            if let temp = weatherInCurrentLocation?.temp_min.toCelsius() {
                cell.secondValue.text = "\(String(describing: temp))°"
            }
        default: break
            
        }
        return cell
    }
}




