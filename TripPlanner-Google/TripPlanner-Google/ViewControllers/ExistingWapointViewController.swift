//
//  ExistingWapointViewController.swift
//  TripPlanner-Google
//
//  Created by Joshua Archer on 10/27/15.
//  Copyright © 2015 Joshua Archer. All rights reserved.
//

import UIKit
import MapKit

class ExistingWapointViewController: UIViewController {
    
    var waypointName: String?
    var waypoint: Waypoint?
    
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()

        // Do any additional setup after loading the view.
    }
    
    func setUp() {
        if let waypoint = waypoint {
            let wayName = waypoint.name
            self.navigationItem.title = wayName
            let lat = Double(waypoint.latitude!)
            let long = Double(waypoint.longitude!)
            let location = CLLocation(latitude: lat, longitude: long)
            MapHelper.setMapLocationWithPoint(mapView, location: location, point: true, name: wayName!)
        }
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
