//
//  LoginViewController.swift
//  TripPlanner-Google
//
//  Created by Joshua Archer on 11/5/15.
//  Copyright © 2015 Joshua Archer. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var username: String?
    var password: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(sender: AnyObject) {
        self.username = usernameTextField.text
        self.password = passwordTextField.text
        
        
    }
    
    @IBAction func postButtonTapped(sender: AnyObject) {
        self.username = usernameTextField.text
        self.password = passwordTextField.text
        guard let username = username, password = password else {return}
        APIHelper.singleInstance.postUser(username, password: password)
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
