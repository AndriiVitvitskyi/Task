//
//  AddNewCityViewController.swift
//  Andrii_Vitvitskyi_WeatherApp
//
//  Created by Mac on 08.03.18.
//  Copyright © 2018 Vitvitskyi. All rights reserved.
//

import UIKit
import CoreLocation
import GooglePlaces

class AddNewCityViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var presenter: AddNewCityPresenterProtocol!
    var city: [CityModel] = []
    
    weak var homeVC: HomeViewControllerProtocolInput?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        AddNewCityAssembly.sharedInstance.configure(self, navVC: navigationController!)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 70
    }

    @IBAction func presentHomeVC(_ sender: Any) {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        present(autocompleteController, animated: true, completion: nil)
    }
}

extension AddNewCityViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return city.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifired") as? AddNewCityCellTableViewCell else { return UITableViewCell()}
        cell.cityName.text = city[indexPath.row].name
        if indexPath.row == 0 {
            cell.currentLocationImage.isHidden = false
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.homeVC?.weatherFromAddNewCity(coordinate: city[indexPath.row].coordinate!, cityName: city[indexPath.row].name!)
        self.presenter.pushToHomeVCPresenter()
    }
}

extension AddNewCityViewController: GMSAutocompleteViewControllerDelegate {
    
    // Handle the user's selection.
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        city.append(CityModel(name: place.name, coordinate: place.coordinate))
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // User canceled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
}
