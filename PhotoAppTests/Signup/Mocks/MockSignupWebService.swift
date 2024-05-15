//
//  MockSignupWebService.swift
//  PhotoAppTests
//
//  Created by Hakan Or on 15.05.2024.
//

import Foundation
@testable import PhotoApp

class MockSignupWebService: SignupWebServiceProtocol {
    
    var isSignupMethodCalled: Bool = false
    var shouldReturnError: Bool = false
    
    func signup(withForm formModel: PhotoApp.SignupFormRequestModel, completion: @escaping ((PhotoApp.SignupResponseModel?, PhotoApp.SignupError?) -> Void)) {
        isSignupMethodCalled = true
        
        if shouldReturnError {
            completion(nil, SignupError.failedRequest(description: "Signup request was not successful"))
        } else {
            let responseModel = SignupResponseModel(status: "Ok")
            completion(responseModel, nil)
        }
        
    }
}
