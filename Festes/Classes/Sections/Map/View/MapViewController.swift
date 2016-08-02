//
//  MapViewController.swift
//  Festes
//
//  Created by Carlos Roig on 01/08/16.
//  Copyright © 2016 Festes. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, GetCurrentLocationDelegate {

    let getUserLocation : GetCurrentLocation = GetCurrentLocation()
    let newtworkProvider : UserNetworkProvider = UserNetworkProvider()
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getUserLocation.delegate = self;
        self.getUserLocation.startLocatingUser()
    }

    func locationUpdatedWithError() {
        print("Error updating location")
    }
    
    func locationUpdatedWithCoordinates(location: CLLocation) {
        print(location.coordinate)
        self.newtworkProvider.updateLoggedUserLocation(location)
    }

}
