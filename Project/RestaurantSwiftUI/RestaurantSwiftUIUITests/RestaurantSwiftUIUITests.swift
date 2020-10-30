//
//  RestaurantSwiftUIUITests.swift
//  RestaurantSwiftUIUITests
//
//  Created by Ludovic Ollagnier on 30/10/2020.
//

import XCTest

class RestaurantSwiftUIUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        app.navigationBars["Restaurants"].buttons["New"].tap()

        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.textFields["Name"]/*[[".cells[\"Name\"].textFields[\"Name\"]",".textFields[\"Name\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

        let addressTextField = tablesQuery.textFields["Address"]
        addressTextField.tap()

        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Save"]/*[[".cells[\"Save\"].buttons[\"Save\"]",".buttons[\"Save\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()


        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testqqchose() {

        let app = XCUIApplication()
        app.launch()

        let newButton = app.navigationBars["Restaurants"].buttons["New"]
        newButton.tap()
        newButton.tap()

        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.textFields["Name"]/*[[".cells[\"Name\"].textFields[\"Name\"]",".textFields[\"Name\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

        let aKey = app/*@START_MENU_TOKEN@*/.keys["A"]/*[[".keyboards.keys[\"A\"]",".keys[\"A\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        aKey.tap()
        aKey.tap()

        let zKey = app/*@START_MENU_TOKEN@*/.keys["z"]/*[[".keyboards.keys[\"z\"]",".keys[\"z\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        zKey.tap()
        zKey.tap()

        let eKey = app/*@START_MENU_TOKEN@*/.keys["e"]/*[[".keyboards.keys[\"e\"]",".keys[\"e\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        eKey.tap()
        eKey.tap()

        let rKey = app/*@START_MENU_TOKEN@*/.keys["r"]/*[[".keyboards.keys[\"r\"]",".keys[\"r\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        rKey.tap()
        rKey.tap()
        app/*@START_MENU_TOKEN@*/.keys["t"]/*[[".keyboards.keys[\"t\"]",".keys[\"t\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let yKey = app/*@START_MENU_TOKEN@*/.keys["y"]/*[[".keyboards.keys[\"y\"]",".keys[\"y\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        yKey.tap()
        yKey.tap()

        let addressTextField = tablesQuery/*@START_MENU_TOKEN@*/.textFields["Address"]/*[[".cells[\"Address\"].textFields[\"Address\"]",".textFields[\"Address\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        addressTextField.tap()
        addressTextField.tap()
        aKey.tap()
        aKey.tap()
        zKey.tap()
        eKey.tap()
        eKey.tap()
        rKey.tap()

    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
