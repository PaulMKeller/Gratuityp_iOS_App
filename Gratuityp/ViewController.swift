//
//  ViewController.swift
//  Gratuityp
//
//  Created by Paul Keller on 17/06/2016.
//  Copyright © 2016 Planet K Games. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var fname: UITextField!
    @IBOutlet weak var lname: UITextField!
    @IBOutlet weak var country: UITextField!
    
    @IBAction func submit(sender: AnyObject) {
        submitDetails()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
        Submit details for Gratuityp registration
    */
    func submitDetails() {
        
            let url:NSURL = NSURL(string: "http://www.gratuityp.com/php/register.php")!
            let session = NSURLSession.sharedSession()
            
            let request = NSMutableURLRequest(URL: url)
            request.HTTPMethod = "POST"
            request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
            
            let paramString = "email=bob@c.com,firstname=Trevor,Lastname=McDonald,country=UK"
            request.HTTPBody = paramString.dataUsingEncoding(NSUTF8StringEncoding)
            
            let task = session.dataTaskWithRequest(request) {
                (
                let data, let response, let error) in
                
                guard let _:NSData = data, let _:NSURLResponse = response  where error == nil else {
                    print("error")
                    return
                }
                
                let dataString = NSString(data: data!, encoding: NSUTF8StringEncoding)
                print(dataString)
                
            }
            
            task.resume()
            
        
        
        
        
    }


}

