//
//  SignupPresenterProtocol.swift
//  PhotoApp
//
//  Created by Hakan Or on 15.05.2024.
//

import Foundation

protocol SignupPresenterProtocol: AnyObject {
    init(formModelValidator: SignupModelValidatorProtocol,
         webservice: SignupWebServiceProtocol,
         delegate: SignupViewDelegateProtocol
    )
    func processUserSignup(formModel: SignupFormModel)
}
