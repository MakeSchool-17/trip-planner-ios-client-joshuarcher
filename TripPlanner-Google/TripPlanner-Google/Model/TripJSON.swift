//
//  TripJSON.swift
//  TripPlanner-Google
//
//  Created by Joshua Archer on 11/5/15.
//  Copyright © 2015 Joshua Archer. All rights reserved.
//

import Foundation
import Gloss

struct TripJSON: Decodable {
    let name: String?
    let serverID: String?
    let waypoints: [WaypointJSON]?
    
    init?(json: JSON) {
        self.name = "name" <~~ json
        self.serverID = "_id" <~~ json
        self.waypoints = "waypoints" <~~ json
    }
}