//
//  SignupPresenter.swift
//  PhotoApp
//
//  Created by Hakan Or on 15.05.2024.
//

import Foundation

class SignupPresenter: SignupPresenterProtocol {
    
    private var formModelValidator: SignupModelValidatorProtocol
    private var webservice: SignupWebServiceProtocol
    private weak var delegate: SignupViewDelegateProtocol?
    
    required init(formModelValidator: SignupModelValidatorProtocol, 
         webservice: SignupWebServiceProtocol,
         delegate: SignupViewDelegateProtocol
    ){
        self.formModelValidator = formModelValidator
        self.webservice = webservice
        self.delegate = delegate
    }
    
    func processUserSignup(formModel: SignupFormModel) {
        
        if !formModelValidator.isFirstNameValid(firstName: formModel.firstName) {
            delegate?.errorHandler(error: .invalidTextField(description: "isFirstNameValid"))
            return
        }
        
        if !formModelValidator.isLastNameValid(lastName: formModel.lastName) {
            delegate?.errorHandler(error: .invalidTextField(description: "isLastNameValid"))
            return
        }
        
        if !formModelValidator.isValidEmailFormat(email: formModel.email) {
            delegate?.errorHandler(error: .invalidTextField(description: "isValidEmailFormat"))
            return
        }
        
        if !formModelValidator.isPasswordValid(password: formModel.password) {
            delegate?.errorHandler(error: .invalidTextField(description: "isPasswordValid"))
            return
        }
        if !formModelValidator.doPasswordsMatch(password: formModel.password, repeatPassword: formModel.repeatPassword) {
            delegate?.errorHandler(error: .invalidTextField(description: "doPasswordsMatch"))
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
