//
//  CoreDataHelper.swift
//  TripPlanner-Google
//
//  Created by Joshua Archer on 10/28/15.
//  Copyright © 2015 Joshua Archer. All rights reserved.
//

import Foundation
import CoreData

class CoreDataHelper {
    
    // create singleton for entire application
    static let singleInstance = CoreDataHelper()
    
    let moc = CoreDataStack(stackType: .InMemory).managedObjectContext
    
    // MARK: - Trip Resource
    
    func addTrip(name: String?) {
        // create new instance using name of entity
        let trip: Trip = NSEntityDescription.insertNewObjectForEntityForName("Trip", inManagedObjectContext: moc) as! Trip
        trip.locationName = name
        
        // save changes
        do {
            try moc.save()
            print("great success saving trip")
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func getTrips() -> [Trip] {
        let fetchRequest = NSFetchRequest(entityName: "Trip")
        
        let alphaSort = NSSortDescriptor(key: "locationName", ascending: true)
        fetchRequest.sortDescriptors = [alphaSort]
        
        var results = [Trip]()
        
        do {
            results = try moc.executeFetchRequest(fetchRequest) as! [Trip]
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        return results
    }
    
    func addWaypoint(name: String, lat: Int, long: Int, trip: Trip) {
        let waypoint: Waypoint = NSEntityDescription.insertNewObjectForEntityForName("Waypoint", inManagedObjectContext: moc) as! Waypoint
        waypoint.name = name
        waypoint.latitude = lat
        waypoint.longitude = long
        waypoint.parentTrip = trip
        
        // save changes
        do {
            try moc.save()
            print("great success saving trip")
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func getWaypointsGivenTrip(trip: Trip) -> [Waypoint] {
        let fetchRequest = NSFetchRequest(entityName: "Waypoint")
        
        return []
    }
    
    
}