//
//  SignupPresenterTests.swift
//  PhotoAppTests
//
//  Created by Hakan Or on 15.05.2024.
//

import XCTest
@testable import PhotoApp

final class SignupPresenterTests: XCTestCase {
    
    var signupFormModel: SignupFormModel!
    var mockSignupModelValidator: MockSignupModelValidator!
    var mockSignupWebService: MockSignupWebService!
    var sut: SignupPresenter!
    var mockSignupView: MockSignupView!
    
    override func setUpWithError() throws {
        signupFormModel = SignupFormModel(firstName: "Hakan",
                                              lastName: "Or",
                                              email: "test@test.com",
                                              password:"1234",
                                              repeatPassword:"1234")
        mockSignupModelValidator = MockSignupModelValidator()
        mockSignupWebService = MockSignupWebService()
        mockSignupView = MockSignupView()
        sut = SignupPresenter(formModelValidator: mockSignupModelValidator,
                              webservice: mockSignupWebService
        )
        sut.view = mockSignupView
    }

    override func tearDownWithError() throws {
        signupFormModel = nil
        mockSignupModelValidator = nil
        mockSignupWebService = nil
        mockSignupView = nil
        sut = nil
    }
    
    func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
        // Arrange
        
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        
        // Assert
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated)
        XCTAssertTrue(mockSignupModelValidator.isLastNameValidated)
        XCTAssertTrue(mockSignupModelValidator.isEmailFormatValidated)
        XCTAssertTrue(mockSignupModelValidator.isPasswordValidated)
        XCTAssertTrue(mockSignupModelValidator.isPasswordEqualityValidated)
    }
    
    func testSignupPresenter_WhenGivenValidFormModel_ShouldCallSignupMethod() {
        // Arrange
        
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        
        // Assert
        XCTAssertTrue(mockSignupWebService.isSignupMethodCalled)
    }
    
    func testSignupPresenter_WhenSignupOperationSuccessful_CallsSuccessOnViewDelegate() {
        // Arrange
        
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        
        // Assert
        XCTAssertEqual(mockSignupView.accessibilityIdentifier, "successAlertDialog")
        XCTAssertEqual(mockSignupView.displayAlertCounter, 1)
    }
    
    func testSignupPresenter_WhenSignupOperationFails_CallsErrorHandlerOnViewDelegate() {
        // Arrange
        
        mockSignupWebService.shouldReturnError = true
        
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        
        // Assert
        XCTAssertEqual(mockSignupView.accessibilityIdentifier, "errorAlertDialog")
        XCTAssertEqual(mockSignupView.displayAlertCounter, 1)
    }

}
