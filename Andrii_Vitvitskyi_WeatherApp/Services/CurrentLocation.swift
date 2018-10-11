//
//  CurrentLocation.swift
//  Andrii_Vitvitskyi_WeatherApp
//
//  Created by Mac on 09.03.18.
//  Copyright © 2018 Vitvitskyi. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager {
    
 func locationManagerSettings() {
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestWhenInUseAuthorization()
    locationManager.startUpdatingLocation()
}

func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let location = locations[0]
    let center = location.coordinate
    let geocoder = CLGeocoder()

    let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    let region = MKCoordinateRegion(center: center, span: span)
    mapView.setRegion(region, animated: true)
    mapView.showsUserLocation = true
    let geoCoder = CLGeocoder()
    geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in

        // Place details
        var placeMark: CLPlacemark!
        placeMark = placemarks?[0]

        // Complete address as PostalAddress
        print(placeMark.subAdministrativeArea as Any)  //  Import Contacts

    })
}
