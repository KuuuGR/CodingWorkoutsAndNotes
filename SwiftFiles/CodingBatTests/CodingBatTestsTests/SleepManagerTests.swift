//
//  SleepManagerTests.swift
//  CodingBatTestsTests
//
//  Created by Grzegorz Kulesza on 18/07/2023.
//

import XCTest
@testable import CodingBatTests

class SleepInManagerTests: XCTestCase {
    
    var sleepInManager: SleepInManager!

    override func setUp() {
        super.setUp()
        sleepInManager = SleepInManager()
    }

    override func tearDown() {
        sleepInManager = nil
        super.tearDown()
    }

    func testSleepIn() {
        XCTAssertTrue(sleepInManager.sleepIn(false, false)) // Expects true
        XCTAssertFalse(sleepInManager.sleepIn(true, false)) // Expects false
        XCTAssertTrue(sleepInManager.sleepIn(false, true)) // Expects true
        XCTAssertTrue(sleepInManager.sleepIn(true, true)) // Expects true
    }
}

