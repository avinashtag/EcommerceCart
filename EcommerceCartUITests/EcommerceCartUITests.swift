//
//  EcommerceCartUITests.swift
//  EcommerceCartUITests
//
//  Created by Avinash on 05/09/2024.
//

import XCTest

final class EcommerceCartUITests: XCTestCase {

    let app = XCUIApplication()

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
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    
//    func testRegistration(){
//        
//        let signup = app.buttons.element
//        si
//        XCTAssert(app.buttons.element.exists, <#T##message: String##String#>)
//    }
    
    func testTabBar(){
        let newsTab = app.tabBars.buttons.element(boundBy: 0)
        let bookmarkTab = app.tabBars.buttons.element(boundBy: 1)
        
//        let addPatientButton = app.navigationBars.buttons["person.fill.badge.plus"]
        XCTAssert(newsTab.exists, "\(TabBarView.self)- News Tab Missing")
        XCTAssert(bookmarkTab.exists, "\(TabBarView.self)- Bookmark Tab Missing")
        XCTAssert(newsTab.label == "News Feed", "\(TabBarView.self)- News Tab Wrong Title")
        XCTAssert(bookmarkTab.label == "Bookmark", "\(TabBarView.self)- News Tab Wrong Title")
    }

}
