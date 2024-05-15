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
    
    init(formModelValidator: PhotoApp.SignupModelValidatorProtocol, webservice: PhotoApp.SignupWebServiceProtocol, delegate: PhotoApp.SignupViewDelegateProtocol) {
        
    }
    
    func processUserSignup(formModel: PhotoApp.SignupFormModel) {
        processUserSignupCalled = true
    }
}
