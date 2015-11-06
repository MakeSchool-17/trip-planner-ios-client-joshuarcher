//
//  TripListViewController.swift
//  TripPlanner-Google
//
//  Created by Joshua Archer on 10/26/15.
//  Copyright © 2015 Joshua Archer. All rights reserved.
//

import UIKit
import CoreData

class TripListViewController: UIViewController {
    
    var trips: [Trip] = []

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        //super.viewWillAppear(animated)
        self.trips = CoreDataHelper.getTrips()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation
    
    @IBAction func unwindToSegue(segue: UIStoryboardSegue) {
        if let identifier = segue.identifier {
            print("unwinding \(identifier) segue")
        }
    }
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showTripDetail" {
            if let nextVc: TripDetailViewController = segue.destinationViewController as? TripDetailViewController {
                if let trip = sender as! Trip? {
                    nextVc.trip = trip
                }
            }
        }
    }


}

// MARK: - Table view methods

extension TripListViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trips.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: TripListTableViewCell = tableView.dequeueReusableCellWithIdentifier("tripCell") as! TripListTableViewCell
        cell.trip = trips[indexPath.row]
        return cell
    }
    
}

extension TripListViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // present trip detail and send trip name
        self.performSegueWithIdentifier("showTripDetail", sender: trips[indexPath.row])
    }
    
}
