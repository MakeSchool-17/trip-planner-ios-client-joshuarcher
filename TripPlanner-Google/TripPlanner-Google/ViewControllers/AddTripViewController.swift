//
//  AddTripViewController.swift
//  TripPlanner-Google
//
//  Created by Joshua Archer on 10/26/15.
//  Copyright © 2015 Joshua Archer. All rights reserved.
//

import UIKit

class AddTripViewController: UIViewController {
    
    @IBOutlet weak var tripNameTextField: UITextField!
    
    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonPressed(sender: AnyObject) {
        if tripNameTextField.text?.characters.count != 0 {
            let nameOfTrip = tripNameTextField.text
            CoreDataHelper.singleInstance.addTrip(nameOfTrip)
            self.navigationController?.popViewControllerAnimated(true)
        } else {
            let alert = UIAlertController(title: "Sorry!", message: "Please enter a trip name before saving :)", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Thanks!", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
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
