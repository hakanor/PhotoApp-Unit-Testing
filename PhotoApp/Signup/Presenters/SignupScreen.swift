//
//  SignupScreen.swift
//  PhotoApp
//
//  Created by Hakan Or on 16.05.2024.
//

import UIKit

final class SignupScreen: Screen {
    func build() -> UIViewController {
        let signupModelValidator = SignupFormModelValidator()
        let webservice = SignupWebService(urlString: SignupConstants.signupURLString)
        let presenter = SignupPresenter(formModelValidator: signupModelValidator, webservice: webservice)
        let view = SignupViewController()
        view.signupPresenter = presenter
        presenter.view = view
        return view
    }
}
