//
//  GratuitypTests.swift
//  GratuitypTests
//
//  Created by Paul Keller on 17/06/2016.
//  Copyright © 2016 Planet K Games. All rights reserved.
//

import XCTest
@testable import Gratuityp

class GratuitypTests: XCTestCase {
    
    var viewController : ViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        viewController = storyboard.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        UIApplication.sharedApplication().keyWindow!.rootViewController = viewController
        
        let _ = viewController.view
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testEmailAddressIsValid(){
        // This is the wrong place for this.
        // This is a UI test
//        if (viewController.email == "") {
//            XCTAssert(false, "The email address cannot be empty")
//        } else {
//            XCTAssert(true)
//        }
    }
    
}
