//
//  TripDetailViewController.swift
//  TripPlanner-Google
//
//  Created by Joshua Archer on 10/26/15.
//  Copyright © 2015 Joshua Archer. All rights reserved.
//

import UIKit

class TripDetailViewController: UIViewController {
    
    var tripName: String?
    var trip: Trip?
    @IBOutlet weak var tripDetailContainer: UIView!
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = trip?.locationName
        if tripName == "san francisco" {
            tripDetailContainer.hidden = true
        } else {
            
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let segueName = segue.identifier
        if segueName == "showTripDetails" {
            let tripVc: ContainerTripDetailViewController = segue.destinationViewController as! ContainerTripDetailViewController
            tripVc.tripDestination = self.tripName
            tripVc.trip = self.trip
        }
    }

}
