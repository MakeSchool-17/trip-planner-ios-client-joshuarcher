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
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = tripName

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