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
    
    weak var trip: Trip?
    var location: CLLocation?
    var searchController: UISearchController?
    var googlePlace: GMSPlace?

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
            MapHelper.setMapLocationWithPoint(mapView, location: location, point: false)
        }
        // hide initial search table view
        waypointSearchTableView.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Helper
    
    @IBAction func saveButtonPressed(sender: AnyObject) {
        if let trip = trip {
            if let googlePlace = googlePlace {
                CoreDataHelper.addWapointWithPlace(googlePlace, trip: trip)
            } else {
                showSaveAlert()
                return
            }
        }
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func showSaveAlert() {
        let alertTitle = "Hey now.."
        let message = "Please pick a place first!"
        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
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
            GooglePlacesHelper.getPlacesGivenSearch(searchText, completion: { (results) -> Void in
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

extension NewWaypointViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let placeSelectedID = googleMapsPlaces[indexPath.row].placeID
        
        // hide table view and resign search bar
        self.waypointSearchTableView.hidden = true
        self.waypointSearchBar.resignFirstResponder()
        
        // get place and show on map
        GooglePlacesHelper.getPlaceGivenID(placeSelectedID) { (place) -> Void in
            self.googlePlace = place
            let placeCo = place.coordinate
            self.location = CLLocation(latitude: placeCo.latitude, longitude: placeCo.longitude)
            MapHelper.setMapLocationWithPoint(self.mapView, location: self.location!, point: true, name: place.name)
        }
    }
    
}

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








