//
//  ContainerTripDetailViewController.swift
//  TripPlanner-Google
//
//  Created by Joshua Archer on 10/27/15.
//  Copyright © 2015 Joshua Archer. All rights reserved.
//

import UIKit

class ContainerTripDetailViewController: UIViewController {
    
    var tripDestination: String?
    @IBOutlet weak var tripDestinationLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let tripDestination = tripDestination {
            tripDestinationLabel.text = "Destination: \(tripDestination)"
        }

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
