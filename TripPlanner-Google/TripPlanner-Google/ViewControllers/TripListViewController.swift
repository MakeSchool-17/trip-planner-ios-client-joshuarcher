//
//  TripListViewController.swift
//  TripPlanner-Google
//
//  Created by Joshua Archer on 10/26/15.
//  Copyright © 2015 Joshua Archer. All rights reserved.
//

import UIKit

class TripListViewController: UIViewController {
    
    let dummyTripNames = ["san francisco", "yosemite", "los angeles", "zion national park"]

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
                let cellTripName: String = sender as? String ?? ""
                nextVc.tripName = cellTripName
            }
        }
    }


}

// MARK: - Table view methods

extension TripListViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyTripNames.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("tripNameCell") as UITableViewCell!
        cell.textLabel?.text = dummyTripNames[indexPath.row]
        return cell
    }
    
}

extension TripListViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // present trip detail and send trip name
        self.performSegueWithIdentifier("showTripDetail", sender: tableView.cellForRowAtIndexPath(indexPath)?.textLabel?.text)
    }
    
}
