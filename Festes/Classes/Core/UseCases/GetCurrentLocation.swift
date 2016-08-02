//
//  GetCurrentLocation.swift
//  Festes
//
//  Created by Carlos Roig on 02/08/16.
//  Copyright © 2016 Festes. All rights reserved.
//

import UIKit
import CoreLocation

protocol GetCurrentLocationDelegate {
    func locationUpdatedWithCoordinates(location : CLLocation)
    func locationUpdatedWithError()
}

class GetCurrentLocation: NSObject, CLLocationManagerDelegate {
    
    let locationManager : CLLocationManager = CLLocationManager()
    var delegate : GetCurrentLocationDelegate?
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.desiredAccuracy = kCLLocationAccuracyBest

    }
    
    func requestLocationIfNeeded() {
        if CLLocationManager.authorizationStatus() == .NotDetermined {
            self.locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func startLocatingUser() {
        self.requestLocationIfNeeded()
        self.locationManager.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        self.locationManager.stopUpdatingLocation()
        self.delegate!.locationUpdatedWithError()
        print(error)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.locationManager.stopUpdatingLocation()

        let locationArray = locations as NSArray
        let locationObj = locationArray.lastObject as! CLLocation
        
        self.delegate!.locationUpdatedWithCoordinates(locationObj)
    }

}
