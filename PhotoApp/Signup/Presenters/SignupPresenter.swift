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
    weak var view: SignupView?
    
    init(formModelValidator: SignupModelValidatorProtocol,
         webservice: SignupWebServiceProtocol
    ){
        self.formModelValidator = formModelValidator
        self.webservice = webservice
    }
    
    func processUserSignup(formModel: SignupFormModel) {
        
        if !formModelValidator.isFirstNameValid(firstName: formModel.firstName) {
            view?.displayAlert(
                title: "Error",
                message: "isFirstNameValid",
                accessibilityIdentifier: "errorAlertDialog"
            )
            return
        }
        
        if !formModelValidator.isLastNameValid(lastName: formModel.lastName) {
            view?.displayAlert(
                title: "Error",
                message: "isLastNameValid",
                accessibilityIdentifier: "errorAlertDialog"
            )
            return
        }
        
        if !formModelValidator.isValidEmailFormat(email: formModel.email) {
            view?.displayAlert(
                title: "Error",
                message: "isValidEmailFormat",
                accessibilityIdentifier: "errorAlertDialog"
            )
            return
        }
        
        if !formModelValidator.isPasswordValid(password: formModel.password) {
            view?.displayAlert(
                title: "Error",
                message: "isPasswordValid",
                accessibilityIdentifier: "errorAlertDialog"
            )
            return
        }
        
        if !formModelValidator.doPasswordsMatch(password: formModel.password, repeatPassword: formModel.repeatPassword) {
            view?.displayAlert(
                title: "Error",
                message: "doPasswordsMatch",
                accessibilityIdentifier: "errorAlertDialog"
            )
            return
        }
        
        let requestModel = SignupFormRequestModel(firstName: formModel.firstName,
                                                  lastName: formModel.lastName,
                                                  email: formModel.email,
                                                  password: formModel.password)
        
        webservice.signup(withForm: requestModel) { [weak self] (responseModel, error) in
            if let error = error {
                self?.view?.displayAlert(
                    title: "Error",
                    message: error.errorDescription ?? "Error",
                    accessibilityIdentifier: "errorAlertDialog"
                )
            } else {
                self?.view?.displayAlert(
                    title: "Success",
                    message: "The signup operation was successful successful",
                    accessibilityIdentifier: "successAlertDialog"
                )
            }
        }
    }
}
