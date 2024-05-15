//
//  MockSignupModelValidator.swift
//  PhotoAppTests
//
//  Created by Hakan Or on 15.05.2024.
//

import Foundation
@testable import PhotoApp

class MockSignupModelValidator: SignupModelValidatorProtocol {
    
    var isFirstNameValidated: Bool = false
    func isFirstNameValid(firstName: String) -> Bool {
        isFirstNameValidated = true
        return isFirstNameValidated
    }
    
    var isLastNameValidated: Bool = false
    func isLastNameValid(lastName: String) -> Bool {
        isLastNameValidated = true
        return isLastNameValidated
    }
    
    var isEmailFormatValidated: Bool = false
    func isValidEmailFormat(email: String) -> Bool {
        isEmailFormatValidated = true
        return isEmailFormatValidated
    }
    
    var isPasswordValidated: Bool = false
    func isPasswordValid(password: String) -> Bool {
        isPasswordValidated = true
        return isPasswordValidated
    }
    
    var isPasswordEqualityValidated: Bool = false
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
        isPasswordEqualityValidated = true
        return isPasswordEqualityValidated
    }
    
}
