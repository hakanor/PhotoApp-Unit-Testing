//
//  PhotoAppUITests.swift
//  PhotoAppUITests
//
//  Created by Hakan Or on 10.05.2024.
//

import XCTest

final class SignupFlowUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    private var firstName: XCUIElement!
    private var lastName: XCUIElement!
    private var email: XCUIElement!
    private var password: XCUIElement!
    private var repeatPassword: XCUIElement!
    private var signupButton: XCUIElement!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        // UI tests must launch the application that they test.
        app = XCUIApplication()
        app.launch()
        
        // firstName -> accessing with accesibility identifier
        // others -> Placeholder
        firstName = app.textFields["firstNameTextField"]
        lastName = app.textFields["Last name:"]
        email = app.textFields["Email:"]
        password = app.textFields["Password:"]
        repeatPassword = app.textFields["Repeat password:"]
        signupButton = app.buttons["Signup"]
        
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        app = nil
        
        firstName = nil
        lastName = nil
        email = nil
        password = nil
        repeatPassword = nil
        signupButton =  nil
        try super.tearDownWithError()
    }

    func testSignupViewController_WhenViewLoaded_RequiredUIElementsAreEnabled() throws {
        
//        app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element(boundBy: 0).tap()
//        
//        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
//        element.children(matching: .textField).element(boundBy: 1).tap()
//        element.children(matching: .textField).element(boundBy: 2).tap()
//        element.children(matching: .textField).element(boundBy: 3).tap()
//        element.children(matching: .textField).element(boundBy: 4).tap()
//        app.buttons["Button"].tap()

        // Assert
        XCTAssertTrue(firstName.isEnabled)
        XCTAssertTrue(lastName.isEnabled)
        XCTAssertTrue(email.isEnabled)
        XCTAssertTrue(password.isEnabled)
        XCTAssertTrue(repeatPassword.isEnabled)
        XCTAssertTrue(signupButton.isEnabled)
    }
    
    func testViewController_WhenInvalidFromSubmitted_PresentsErrorAlertDialog() throws {
        // Arrange
        firstName.tap()
        firstName.typeText("Hakan")
        
        lastName.tap()
        lastName.typeText("Hakan")
        
        email.tap()
        email.typeText("Hakan")
        
        password.tap()
        password.typeText("Hakan")
        
        repeatPassword.tap()
        repeatPassword.typeText("Hakan")
        
        // Act
        signupButton.tap()
        
        // Assert
        XCTAssertTrue(app.alerts["errorAlertDialog"].waitForExistence(timeout: 1), "An Error Alert dialog was not presented when invalid signup form was submitted")
    }
    
    func testViewController_WhenValidFromSubmitted_PresentsErrorAlertDialog() throws {
        // Arrange
        firstName.tap()
        firstName.typeText("Hakan")
        
        lastName.tap()
        lastName.typeText("Or")
        
        email.tap()
        email.typeText("test@test.com")
        
        password.tap()
        password.typeText("12345678")
        
        repeatPassword.tap()
        repeatPassword.typeText("12345678")
        
        // Act
        signupButton.tap()
        
        // Assert
        XCTAssertTrue(app.alerts["successAlertDialog"].waitForExistence(timeout: 1), "A Success Alert dialog was not presented when invalid signup form was submitted")
    }
    
    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
