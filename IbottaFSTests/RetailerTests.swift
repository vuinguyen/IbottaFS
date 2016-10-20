//
//  RetailerTests.swift
//  IbottaFS
//
//  Created by Vui Nguyen on 10/20/16.
//  Copyright © 2016 Sunfish Empire. All rights reserved.
//

import XCTest
@testable import IbottaFS

// This class tests the Retailer and RetailerManager classes
class RetailerTests: XCTestCase {
    var retailerArray: [Retailer]!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        retailerArray = RetailerManager.getRetailersForIds([25])
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testRetailerForId() {
        //XCTAssertTrue(true, "Hello World")
        XCTAssert(retailerArray[0].name == "H-E-B")
        XCTAssertFalse(retailerArray[0].name == "Target")
    }
    
    // Let's see how long it takes to grab all the retailers from the JSON file
    func testPerformanceExample() {
        self.measureBlock {
            // Put the code you want to measure the time of here.
            RetailerManager.getAllRetailersArray() { (allRetailersArray) -> Void in
                print("Hello World")
            }
            
        }
    }}
