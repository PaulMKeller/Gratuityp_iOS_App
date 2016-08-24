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
    @IBOutlet weak var confirm: UILabel!
    
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
        
        var paramString = "email=" + email.text!
        paramString += "&firstname=" + fname.text!
        paramString += "&lastname=" + lname.text!
        paramString += "&country=" + country.text!
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
        /*
         self.email.text = ""
         self.fname.text = ""
         self.lname.text = ""
         self.country.text = ""
         self.confirm.text = "Thank you for registering!"
         
        _ = NSTimer.scheduledTimerWithTimeInterval(10, target: self, selector: #selector(ViewController.clearMessage), userInfo: nil, repeats: false)
         */
        
        self.confirm.text = "Thank you for registering!"
    }
    
/*
    func clearMessage(){
        self.confirm.text = ""
    }
 */


}

