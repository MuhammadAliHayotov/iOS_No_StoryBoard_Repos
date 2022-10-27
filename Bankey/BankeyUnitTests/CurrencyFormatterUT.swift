//
//  CurrencyFormatterUT.swift
//  BankeyUnitTests
//
//  Created by Mukhammadali Khayotov on 27/10/22.
//

import Foundation

import XCTest
//it allows access to all the files within Bankey directory
@testable import Bankey

class Test: XCTestCase {
    //force unwrapping as we have to have the class for us to test
    var formatter: CurrencyFormatter!
    
    override func setUp(){
        super.setUp()
        formatter = CurrencyFormatter()//create a brand new formatter object
    }
    
    func testShouldBeVisible() throws {
        //checking dollars and cents functions which gets a decimal
        let result_d_c = formatter.breakIntoDollarsAndCents(909098.45)
        XCTAssertEqual(result_d_c.0, "909,098")
        XCTAssertEqual(result_d_c.1, "45")
    }
    func testDollarsFormatted() throws {
        let result = formatter.dollarsFormatted(98987.01)
        XCTAssertEqual(result, "$98,987.01")
    }
    func testZeroDollarFormatted() throws {
        let result = formatter.dollarsFormatted(0)
        XCTAssertEqual(result, "$0.00")
    }
}
