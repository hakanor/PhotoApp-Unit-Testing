//
//  SignupViewControllerTests.swift
//  PhotoAppTests
//
//  Created by Hakan Or on 15.05.2024.
//

import XCTest
@testable import PhotoApp

final class SignupViewControllerTests: XCTestCase {
    
    var sut: SignupViewController!

    override func setUpWithError() throws {
        sut = SignupViewController()
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testSignupViewController_WhenCreated_HasRequiredTextFieldsEmpty() {
        XCTAssertEqual(sut.stackView.subviews.count, 6)
        XCTAssertEqual(sut.userFirstNameTextField.text,"")
        XCTAssertEqual(sut.lastNameTextField.text,"")
        XCTAssertEqual(sut.emailTextField.text,"")
        XCTAssertEqual(sut.passwordTextField.text,"")
        XCTAssertEqual(sut.repeatPasswordTextField.text,"")
    }
    
    func testViewController_WhenSignupButtonTapped_InvokesSignupProcess() {
        // Arrange
        let mockSignupModelValidator = MockSignupModelValidator()
        let mockSignupWebService = MockSignupWebService()
        
        let mockSignupPresenter = MockSignupPresenter()
        
        sut.signupPresenter = mockSignupPresenter
        
        // Act
        sut.signupButton.sendActions(for: .touchUpInside)
        
        // Assert
        XCTAssertTrue(mockSignupPresenter.processUserSignupCalled)
    }
}
