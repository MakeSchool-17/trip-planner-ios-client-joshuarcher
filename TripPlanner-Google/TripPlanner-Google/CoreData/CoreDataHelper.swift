//
//  CoreDataHelper.swift
//  TripPlanner-Google
//
//  Created by Joshua Archer on 10/28/15.
//  Copyright © 2015 Joshua Archer. All rights reserved.
//

import Foundation
import CoreData
import GoogleMaps

class CoreDataHelper {
    
    // create singleton for entire application
    static let singleInstance = CoreDataHelper()
    
    static let moc = CoreDataStack(stackType: .InMemory).managedObjectContext
    
    // MARK: - Trip Resource
    
    static func addTrip(name: String?) {
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
    
    static func getTrips() -> [Trip] {
        let fetchRequest = NSFetchRequest(entityName: "Trip")
        
        let alphaSort = NSSortDescriptor(key: "locationName", ascending: true, selector: "localizedCaseInsensitiveCompare:")
        fetchRequest.sortDescriptors = [alphaSort]
        
        var results = [Trip]()
        
        do {
            results = try moc.executeFetchRequest(fetchRequest) as! [Trip]
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        return results
    }
    
    static func addWaypoint(name: String, lat: Double, long: Double, trip: Trip) {
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
    
    static func addWapointWithPlace(place: GMSPlace, trip: Trip) {
        let wName = place.name
        let wLat = place.coordinate.latitude
        let wLong = place.coordinate.longitude
        
        self.addWaypoint(wName, lat: wLat, long: wLong, trip: trip)
    }
    
    static func getWaypointsGivenTrip(trip: Trip) -> [Waypoint] {
        let fetchRequest = NSFetchRequest(entityName: "Waypoint")
        
        let predicate = NSPredicate(format: "%K == %@", "parentTrip", trip)
        fetchRequest.predicate = predicate
        
        let alphaSort = NSSortDescriptor(key: "name", ascending: true, selector: "localizedCaseInsensitiveCompare:")
        fetchRequest.sortDescriptors = [alphaSort]
        
        var results = [Waypoint]()
        
        do {
            results = try moc.executeFetchRequest(fetchRequest) as! [Waypoint]
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        return results
    }
    
    
}