//
//  WaypointJSON.swift
//  TripPlanner-Google
//
//  Created by Joshua Archer on 11/5/15.
//  Copyright © 2015 Joshua Archer. All rights reserved.
//

import Foundation
import Gloss

struct WaypointJSON: Decodable {
    let name: String?
    let latitude: Double?
    let longitude: Double?
    
    init?(json: JSON) {
        self.name = "name" <~~ json
        self.latitude = "lat" <~~ json
        self.longitude = "long" <~~ json
    }
}