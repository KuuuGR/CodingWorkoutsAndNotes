//
//  WarmupOneManagerTests.swift
//  CodingBat
//
//  Created by Grzegorz Kulesza on 18/07/2023.
//

import SwiftUI
import XCTest
@testable import CodingBat

/// `WarmupOneManagerTests` is a test case class that tests the functionality of the `WarmupOneManager` class.
class WarmupOneManagerTests: XCTestCase {
    
    //MARK: INITIATION:
    
    /// The `WarmupOneManager` instance that will be tested.
    var warmupOneManager: WarmupOneManager!
    
    /// This method is called before the invocation of each test method in the class.
    /// It's used to set up any objects that will be used in the test.
    override func setUp() {
        super.setUp()
        warmupOneManager = WarmupOneManager()
    }
    
    /// This method is called after the invocation of each test method in the class.
    /// It's used to clean up anything that was set up in `setUp()`.
    override func tearDown() {
        warmupOneManager = nil
        super.tearDown()
    }
    
    //MARK: PROPER FUNCTION TESTS:
    
    /// This test method tests the `sleepIn` function of `WarmupOneManager` with different combinations of input values.
    func testSleepIn() {
        XCTAssertTrue(warmupOneManager.sleepIn(false, false)) // Expects true
        XCTAssertFalse(warmupOneManager.sleepIn(true, false)) // Expects false
        XCTAssertTrue(warmupOneManager.sleepIn(false, true)) // Expects true
        XCTAssertTrue(warmupOneManager.sleepIn(true, true)) // Expects true
    }
    
    /// This test method tests the `diff21` function of `WarmupOneManager` with different input values.
    /// It checks if the function's return value is equal to the expected output.
    func testDiff21() {
        // Test case where n is less than 21
        XCTAssertEqual(warmupOneManager.diff21(n: 15), 6) // Expects 6
        
        // Test case where n is equal to 21
        XCTAssertEqual(warmupOneManager.diff21(n: 21), 0) // Expects 0
        
        // Test case where n is greater than 21
        XCTAssertEqual(warmupOneManager.diff21(n: 25), 8) // Expects 8
        
        // Test case where n is much greater than 21
        XCTAssertEqual(warmupOneManager.diff21(n: 100), 158) // Expects 158
    }
}
