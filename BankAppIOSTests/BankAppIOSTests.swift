//
//  BankAppIOSTests.swift
//  BankAppIOSTests
//
//  Created by frankie on 16/9/21.
//  Copyright © 2016年 frankie. All rights reserved.
//

import XCTest
import Alamofire


class BankAppIOSTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
       
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        print("abcc")
        Alamofire.request("https://httpbin.org/get").responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            
            if let JSON = response.result.value {
                print("JSON: \(JSON) \n\n")
                let reponse =  JSON as! NSDictionary
                print("junny\n")
                print(reponse.object(forKey: "origin"))
            }
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
