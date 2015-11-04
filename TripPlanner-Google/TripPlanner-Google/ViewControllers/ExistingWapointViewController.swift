//
//  ExistingWapointViewController.swift
//  TripPlanner-Google
//
//  Created by Joshua Archer on 10/27/15.
//  Copyright © 2015 Joshua Archer. All rights reserved.
//

import UIKit

class ExistingWapointViewController: UIViewController {
    
    var waypointName: String?
    var waypoint: Waypoint?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let waypoint = waypoint {
            self.navigationItem.title = waypoint.name
        }
//        if let way = waypointName {
//            
//            self.navigationItem.title = trip?.locationName
//            print(way)
//        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
