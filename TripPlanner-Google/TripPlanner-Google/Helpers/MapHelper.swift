//
//  MapHelper.swift
//  TripPlanner-Google
//
//  Created by Joshua Archer on 11/3/15.
//  Copyright © 2015 Joshua Archer. All rights reserved.
//

import Foundation
import MapKit

class MapHelper {
    
    static func setMapLocationWithPoint(map: MKMapView, location: CLLocation, point: Bool, name: String="") {
        let regionRadius: CLLocationDistance = 1000
        let coordinate = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2, regionRadius * 2)
        map.setRegion(coordinate, animated: true)
        if point {
            let pointPin = MKPointAnnotation()
            pointPin.coordinate = location.coordinate
            pointPin.title = name
            map.addAnnotation(pointPin)
        }
    }
    
}