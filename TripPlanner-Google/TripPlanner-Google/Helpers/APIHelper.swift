//
//  APIHelper.swift
//  TripPlanner-Google
//
//  Created by Joshua Archer on 11/5/15.
//  Copyright © 2015 Joshua Archer. All rights reserved.
//

import Foundation
import SwiftyJSON

class APIHelper {
    
    static let singleInstance = APIHelper()
    
    let serverURL: String = "http://localhost:27017/"
    let usersURL: String = "users/"
    let tripsURL: String = "trips/"
    
    func getAuthString(name: String, pass: String) -> String {
        let authString = "Basic " + "\(name):\(pass)".base64()
        return authString
    }
    
    func getUsersURL() -> String {
        return serverURL + usersURL
    }
    
    func getTripsURL() -> String {
        return serverURL + tripsURL
    }
    
    // MARK: - User Methods
    
    func postUser(username: String, password: String) {
        let json = ["name":username, "password":password]
        let jsonData = try! NSJSONSerialization.dataWithJSONObject(json, options: NSJSONWritingOptions(rawValue: 0))
        
        let url = NSURL(string: getUsersURL())
        
        let urlRequest = NSMutableURLRequest(URL: url!)
        urlRequest.setValue("application/json", forHTTPHeaderField: "content-type")
        //urlRequest.setValue(getAuthString(username, pass: password), forHTTPHeaderField: "Authorization")
        urlRequest.HTTPMethod = "POST"
        urlRequest.HTTPBody = jsonData
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        let postUserTask = session.dataTaskWithRequest(urlRequest) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            if let response = response {
                print(response)
            }
        }
        
        postUserTask.resume()
        
    }
    
    func checkUser(username: String, password: String) {
        let json = ["name":username, "password":password]
        let _ = try! NSJSONSerialization.dataWithJSONObject(json, options: NSJSONWritingOptions(rawValue: 0))
        
        let url = NSURL(string: getUsersURL())
        
        let urlRequest = NSMutableURLRequest(URL: url!)
        urlRequest.setValue("application/json", forHTTPHeaderField: "content-type")
    }
    
}

extension String {
    func base64() -> String {
        return self.dataUsingEncoding(NSUTF8StringEncoding)!.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
    }
}