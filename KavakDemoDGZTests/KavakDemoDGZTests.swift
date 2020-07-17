//
//  KavakDemoDGZTests.swift
//  KavakDemoDGZTests
//
//  Created by desarrollo on 16/07/20.
//  Copyright © 2020 KavakDemo. All rights reserved.
//

import XCTest
@testable import KavakDemoDGZ

class KavakDemoDGZTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

 
    func testValidiateDataService() throws {
        let promise = expectation(description: "respuesta diferente de nulo")
        var resp:Items? = nil
        
        ServiceManager.shared.GetData(completion: { (response:Items) in
            resp  = response
            promise.fulfill()
        }) { (error) in
             XCTFail("Respuesta code: \(error)")
        }
        
        wait(for: [promise], timeout: 7)
        //XCTAssertNil(resp)
        XCTAssertEqual(resp?.brastlewark?.count, 1337)
        
    }

   func testValidiateDataService2() throws {
       let promise = expectation(description: "respuesta diferente de nulo")
       var resp:Items? = nil
       
       ServiceManager.shared.GetData(completion: { (response:Items) in
           resp  = response
           promise.fulfill()
       }) { (error) in
            XCTFail("Respuesta code: \(error)")
       }
       
       wait(for: [promise], timeout: 7)
       //XCTAssertNil(resp)
       XCTAssertEqual(resp?.brastlewark?.count, 1337)
       
   }
}
