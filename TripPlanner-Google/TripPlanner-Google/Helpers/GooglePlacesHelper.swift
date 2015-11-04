//
//  GooglePlacesHelper.swift
//  TripPlanner-Google
//
//  Created by Joshua Archer on 11/3/15.
//  Copyright © 2015 Joshua Archer. All rights reserved.
//

import Foundation
import GoogleMaps

class GooglePlacesHelper {
    
    // single instance of the google places client
    static let googlePlacesClient = GMSPlacesClient()
    
    static func getPlaces(searchString: String, completion: (results: [GMSAutocompletePrediction]) -> Void ) {
        googlePlacesClient.autocompleteQuery(searchString, bounds: nil, filter: nil) { (results, error: NSError?) -> Void in
            if let error = error {
                print(error.debugDescription)
            }
            
            if let results = results as? [GMSAutocompletePrediction] {
                completion(results: results)
            }
        }
    }
    
    
}
