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
    
    //MARK: MAIN FUNCTION TESTS:
    
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
    
    
    /**
     Test the `nearHundred` function of the `WarmupOneManager` class.

     This test method verifies the correctness of the `nearHundred` function by testing it with various input values.

     - Test Cases:
       1. When the input `n` is 93, the function should return `true`.
       2. When the input `n` is 90, the function should return `true`.
       3. When the input `n` is 89, the function should return `false`.
       4. When the input `n` is 110, the function should return `true`.
       5. When the input `n` is 190, the function should return `true`.
       6. When the input `n` is 210, the function should return `false`.

     This test method is part of the `WarmupOneManagerTests` class and ensures that the `nearHundred` function behaves as expected for different scenarios.

     - Note: The `nearHundred` function checks if the given integer `n` is within 10 of either 100 or 200, and returns `true` if it is, or `false` otherwise.
     */
    func testNearHundred() {
        // Test case 1: n = 93
        XCTAssertTrue(warmupOneManager.nearHundred(93)) // Expects true

        // Test case 2: n = 90
        XCTAssertTrue(warmupOneManager.nearHundred(90)) // Expects true

        // Test case 3: n = 89
        XCTAssertFalse(warmupOneManager.nearHundred(89)) // Expects false

        // Test case 4: n = 110
        XCTAssertTrue(warmupOneManager.nearHundred(110)) // Expects true

        // Test case 5: n = 190
        XCTAssertTrue(warmupOneManager.nearHundred(190)) // Expects true

        // Test case 6: n = 210
        XCTAssertTrue(warmupOneManager.nearHundred(210)) // Expects true
        
        // Test case 7: n = 211
        XCTAssertFalse(warmupOneManager.nearHundred(211)) // Expects false
    }

    
    // TESTS FOR missingChar FUNCTION:
    /**
     Test the `missingChar` function of the `WarmupOneManager` class.

     This test method verifies the correctness of the `missingChar` function by testing it with various input values.

     - Test Cases:
       1. When the input string is "kitten" and the index n is 1, the function should return "ktten".
       2. When the input string is "kitten" and the index n is 0, the function should return "itten".
       3. When the input string is "kitten" and the index n is 4, the function should return "kittn".

     This test method is part of the `WarmupOneManagerTests` class and ensures that the `missingChar` function behaves as expected for different scenarios.

     - Note: The `missingChar` function takes a non-empty string and an integer `n`, and returns a new string with the character at index `n` removed.
     */
    func testMissingChar() {
        // Test case 1: input string = "kitten", index n = 1
        XCTAssertEqual(warmupOneManager.missingChar("kitten", 1), "ktten") // Expects "ktten"

        // Test case 2: input string = "kitten", index n = 0
        XCTAssertEqual(warmupOneManager.missingChar("kitten", 0), "itten") // Expects "itten"

        // Test case 3: input string = "kitten", index n = 4
        XCTAssertEqual(warmupOneManager.missingChar("kitten", 4), "kittn") // Expects "kittn"
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //MARK: PERFORMANCE TESTS:

     /// Test cases for performance evaluation of "nearHundred" function
     let nearHundredTestCases: [Int] = [
         93,
         90,
         89,
         105,
         110,
         201,
         205,
         180,
         300
     ]

     /// This test method measures the performance of the `nearHundred` function in `WarmupOneManager`.
     func testNearHundredPerformance() {
         measure {
             for testCase in nearHundredTestCases {
                 _ = warmupOneManager.nearHundred(testCase)
             }
         }
     }
    
    
    /// Test cases for performance evaluation of "missingChar" function
    let missingCharTestCases: [(str: String, n: Int)] = [
        ("kitten", 1),
        ("hello", 0),
        ("coding", 5),
        ("world", 2),
        ("swift", 4)
    ]

    /// This test method measures the performance of the `missingChar` function in `WarmupOneManager`.
    func testMissingCharPerformance() {
        measure {
            for testCase in missingCharTestCases {
                _ = warmupOneManager.missingChar(testCase.str, testCase.n)
            }
        }
    }

    
    
    
    
    
}
