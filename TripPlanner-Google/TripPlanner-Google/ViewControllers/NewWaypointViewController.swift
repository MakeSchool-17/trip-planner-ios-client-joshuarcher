//
//  NewWaypointViewController.swift
//  TripPlanner-Google
//
//  Created by Joshua Archer on 10/27/15.
//  Copyright © 2015 Joshua Archer. All rights reserved.
//

import UIKit
import GoogleMaps
import MapKit

class NewWaypointViewController: UIViewController {
    
    var trip: Trip?
    var location: CLLocation?
    var searchController: UISearchController?

    @IBOutlet weak var waypointSearchBar: UISearchBar!
    @IBOutlet weak var waypointSearchTableView: UITableView!
    @IBOutlet weak var mapView: MKMapView!
    
    var googleMapsPlaces = [GMSAutocompletePrediction]()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUp()
    }
    
    func setUp() {
        // set location to Weed, CA
        self.location = CLLocation(latitude: 41.4242, longitude: -122.3844)
        if let location = location {
            setMapLocation(location)
        }
        
        // hide initial search table view
        waypointSearchTableView.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Helper
    
    func setMapLocation(location: CLLocation) {
        let regionRadius: CLLocationDistance = 1000
        let coordinate = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2, regionRadius * 2)
        mapView.setRegion(coordinate, animated: true)
    }
    
    @IBAction func saveButtonPressed(sender: AnyObject) {
        if let trip = trip {
            CoreDataHelper.singleInstance.addWaypoint("joshy", lat: 100, long: 100, trip: trip)
        }
        self.navigationController?.popViewControllerAnimated(true)
    }

}

// MARK: - Search Bar

extension NewWaypointViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        self.waypointSearchTableView.hidden = false
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.characters.count != 0 {
            // go search for places
            GooglePlacesHelper.getPlaces(searchText, completion: { (results) -> Void in
                self.googleMapsPlaces = results
            })
        } else {
            googleMapsPlaces = []
        }
        // update the table view
        self.waypointSearchTableView.reloadData()
    }
    
}

// MARK: - Search TableView

extension NewWaypointViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return googleMapsPlaces.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = waypointSearchTableView.dequeueReusableCellWithIdentifier("placeCell")! as UITableViewCell
        
        cell.textLabel!.text = googleMapsPlaces[indexPath.row].attributedFullText.string
        
        return cell
    }
    
}








