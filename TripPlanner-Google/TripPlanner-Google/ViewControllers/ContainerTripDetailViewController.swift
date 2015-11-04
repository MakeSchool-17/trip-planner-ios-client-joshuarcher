//
//  ContainerTripDetailViewController.swift
//  TripPlanner-Google
//
//  Created by Joshua Archer on 10/27/15.
//  Copyright © 2015 Joshua Archer. All rights reserved.
//

import UIKit

class ContainerTripDetailViewController: UIViewController {
    
    let waypoints = ["bush street", "market street", "embarcadero", "south park", "daly city"]
    
    var CDWaypoints = [Waypoint]()
    var trip: Trip?
    var tripDestination: String?
    @IBOutlet weak var tripDestinationLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let trip = trip {
            tripDestinationLabel.text = "Destination: \(trip.locationName!)"
            self.CDWaypoints = CoreDataHelper.singleInstance.getWaypointsGivenTrip(trip)
        }

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if let trip = trip {
            self.CDWaypoints = CoreDataHelper.singleInstance.getWaypointsGivenTrip(trip)
            tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        if let identifier = segue.identifier {
            print("unwinding \(identifier) segue")
        }
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toExistingWaypoint" {
            if let nextVc: ExistingWapointViewController = segue.destinationViewController as? ExistingWapointViewController {
                let cellWaypoint = sender as? Waypoint ?? nil
                nextVc.waypoint = cellWaypoint
            }
        }
        
        if segue.identifier == "toNewWaypoint" {
            if let nextVc: NewWaypointViewController = segue.destinationViewController as? NewWaypointViewController {
                nextVc.trip = self.trip
            }
        }

        
    }


}

extension ContainerTripDetailViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CDWaypoints.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tripDetailCell") as UITableViewCell!
        cell.textLabel?.text = CDWaypoints[indexPath.row].name
        return cell
    }
    
}

extension ContainerTripDetailViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("toExistingWaypoint", sender: CDWaypoints[indexPath.row])
    }
}

