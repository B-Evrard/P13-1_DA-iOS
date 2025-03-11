//
//  DateExtensionTest.swift
//  RelayanceTests
//
//  Created by Bruno Evrard on 11/03/2025.
//

import XCTest

final class DateExtensionTest: XCTestCase {
    
    func testDateFromString() {
        let dateString = "2025-03-11T09:15:00Z"
        let date = Date.dateFromString(dateString)
        XCTAssertNotNil(date)
        
        let dateStringError = "20250aaa101"
        let dateError = Date.dateFromString(dateStringError)
        XCTAssertNil(dateError)
    }
    
    func testStringFromDate() {
        var components = DateComponents()
        components.year = 2020
        components.month = 10
        components.day = 1
        components.hour = 0
        components.minute = 0
        components.second = 0
        
        let date = Calendar.current.date(from: components)!
        let dateString = Date.stringFromDate(date)
        XCTAssertEqual(dateString, "01-10-2020")
    }
    
    func testGetDay() {
        var components = DateComponents()
        components.year = 2020
        components.month = 10
        components.day = 1
        
        let date = Calendar.current.date(from: components)!
        let day = date.getDay()
        XCTAssertEqual(day,1)
    }
    
    func testGetMonth() {
        var components = DateComponents()
        components.year = 2020
        components.month = 10
        components.day = 1
        
        let date = Calendar.current.date(from: components)!
        let month = date.getMonth()
        XCTAssertEqual(month,10)
    }
    
    func testGetYear() {
        var components = DateComponents()
        components.year = 2020
        components.month = 10
        components.day = 1
        
        let date = Calendar.current.date(from: components)!
        let year = date.getYear()
        XCTAssertEqual(year,2020)
    }
    
}
