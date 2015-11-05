//
//  Waypoint+CoreDataProperties.swift
//  TripPlanner-Google
//
//  Created by Joshua Archer on 11/4/15.
//  Copyright © 2015 Joshua Archer. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Waypoint {

    @NSManaged var latitude: NSNumber?
    @NSManaged var longitude: NSNumber?
    @NSManaged var name: String?
    @NSManaged var parsing: NSNumber?
    @NSManaged var serverID: String?
    @NSManaged var parentTrip: Trip?

}
