//
//  RestaurantSwiftUITests.swift
//  RestaurantSwiftUITests
//
//  Created by Ludovic Ollagnier on 30/10/2020.
//

import XCTest
@testable import RestaurantSwiftUI

class RestaurantSwiftUITests: XCTestCase {

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

    func testAddRestaurant() {

        let library = Library()
        let countBefore = library.list().count
        let resto = Restaurant(name: "Resto", style: .burger, adress: "", mediumPrice: 45.9, veganFriendly: true, alreadyVisited: false)
        library.add(resto)
        let countAfter = library.list().count

        XCTAssertTrue(countAfter == countBefore + 1)
    }

    func testCreateResto() {
        let resto = Restaurant(name: "Resto", style: .burger, adress: "", mediumPrice: 45.9, veganFriendly: true, alreadyVisited: false)

        XCTAssertEqual(resto.name, "Resto")
        XCTAssertEqual(resto.style, Restaurant.Style.burger)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
            let library = Library()
            let resto = Restaurant(name: "Resto", style: .burger, adress: "", mediumPrice: 45.9, veganFriendly: true, alreadyVisited: false)
            library.add(resto)
            library.save()
        }
    }

}
