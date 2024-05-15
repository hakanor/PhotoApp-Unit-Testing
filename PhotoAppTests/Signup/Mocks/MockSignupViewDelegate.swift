//
//  MockSignupViewDelegate.swift
//  PhotoAppTests
//
//  Created by Hakan Or on 15.05.2024.
//

import Foundation
import XCTest
@testable import PhotoApp

class MockSignupViewDelegate: SignupViewDelegateProtocol {

    var expectation: XCTestExpectation?
    var signUpError: SignupError?
    
    var successfulSignupCounter = 0
    func successfullSignup() {
        successfulSignupCounter += 1
        expectation?.fulfill()
    }
    
    var errorHandlerCounter = 0
    func errorHandler(error: PhotoApp.SignupError) {
        errorHandlerCounter += 1
        signUpError = error
        expectation?.fulfill()
    }
    
}
