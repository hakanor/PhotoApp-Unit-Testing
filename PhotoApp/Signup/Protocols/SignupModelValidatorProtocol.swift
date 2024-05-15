//
//  SignupModelValidatorProtocol.swift
//  PhotoApp
//
//  Created by Hakan Or on 10.05.2024.
//

import Foundation

protocol SignupModelValidatorProtocol {
    
      func isFirstNameValid(firstName: String) -> Bool
      
      func isLastNameValid(lastName: String) -> Bool
      
      func isValidEmailFormat(email: String) -> Bool
      func isPasswordValid(password: String) -> Bool
      
      func doPasswordsMatch(password: String, repeatPassword: String) -> Bool
}
