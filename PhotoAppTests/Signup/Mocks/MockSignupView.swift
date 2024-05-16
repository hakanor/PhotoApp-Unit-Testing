//
//  MockSignupView.swift
//  PhotoAppTests
//
//  Created by Hakan Or on 17.05.2024.
//

import Foundation
@testable import PhotoApp

class MockSignupView: SignupView {
    
    var accessibilityIdentifier: String?
    var displayAlertCounter = 0
    
    func displayAlert(title: String, message: String, accessibilityIdentifier: String) {
        self.accessibilityIdentifier = accessibilityIdentifier
        displayAlertCounter += 1
    }
}
