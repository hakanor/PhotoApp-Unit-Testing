//
//  SignupPresenter.swift
//  PhotoApp
//
//  Created by Hakan Or on 15.05.2024.
//

import Foundation

class SignupPresenter {
    
    private var formModelValidator: SignupModelValidatorProtocol
    private var webservice: SignupWebServiceProtocol
    private weak var delegate: SignupViewDelegateProtocol?
    
    init(formModelValidator: SignupModelValidatorProtocol, 
         webservice: SignupWebServiceProtocol,
         delegate: SignupViewDelegateProtocol
    ){
        self.formModelValidator = formModelValidator
        self.webservice = webservice
        self.delegate = delegate
    }
    
    func processUserSignup(formModel: SignupFormModel) {
        
        if !formModelValidator.isFirstNameValid(firstName: formModel.firstName) {
            return
        }
        
        if !formModelValidator.isLastNameValid(lastName: formModel.lastName) {
            return
        }
        
        if !formModelValidator.isValidEmailFormat(email: formModel.email) {
            return
        }
        
        if !formModelValidator.isPasswordValid(password: formModel.password) {
            return
        }
        if !formModelValidator.doPasswordsMatch(password: formModel.password, repeatPassword: formModel.repeatPassword) {
            return
        }
        
        let requestModel = SignupFormRequestModel(firstName: formModel.firstName,
                                                  lastName: formModel.lastName,
                                                  email: formModel.email,
                                                  password: formModel.password)
        
        webservice.signup(withForm: requestModel) { [weak self] (responseModel, error) in
            if let error = error {
                self?.delegate?.errorHandler(error: error)
                return
            } else {
                self?.delegate?.successfullSignup()
            }
        }
    }
}
