//
//  Trip+CoreDataProperties.swift
//  TripPlanner-Google
//
//  Created by Joshua Archer on 11/5/15.
//  Copyright © 2015 Joshua Archer. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Trip {

    @NSManaged var lastUpdate: NSDate?
    @NSManaged var locationName: String?
    @NSManaged var serverID: String?
    @NSManaged var waypoints: NSSet?

}
