//
//  MockSignupPresenter.swift
//  PhotoAppTests
//
//  Created by Hakan Or on 15.05.2024.
//

import Foundation
@testable import PhotoApp

final class MockSignupPresenter: SignupPresenterProtocol {
    
    var processUserSignupCalled: Bool = false
    
    func processUserSignup(formModel: PhotoApp.SignupFormModel) {
        processUserSignupCalled = true
    }
}
