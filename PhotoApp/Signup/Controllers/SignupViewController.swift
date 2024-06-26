//
//  ViewController.swift
//  PhotoApp
//
//  Created by Hakan Or on 10.05.2024.
//

import UIKit

protocol SignupView: AnyObject {
    func displayAlert(title: String, message: String, accessibilityIdentifier: String)
}

final class SignupViewController: UIViewController {
    
    var signupPresenter: SignupPresenterProtocol?

    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    lazy var userFirstNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "First name:"
        textField.accessibilityIdentifier = "firstNameTextField"
        return textField
    }()
    
    lazy var lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "Last name:"
        return textField
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "Email:"
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "Password:"
        return textField
    }()
    
    lazy var repeatPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "Repeat password:"
        return textField
    }()
    
    lazy var signupButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Signup", for: .normal)
        button.backgroundColor = .systemGreen
        button.configuration?.cornerStyle = .capsule
        button.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .systemGray3
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        
        [userFirstNameTextField, lastNameTextField, emailTextField, passwordTextField, repeatPasswordTextField, signupButton].forEach { view in
            stackView.addArrangedSubview(view)
            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
    }
    
    @objc func signupButtonTapped() {
        let formModel = SignupFormModel(firstName: userFirstNameTextField.text ?? "",
                                        lastName: lastNameTextField.text ?? "",
                                        email: emailTextField.text ?? "",
                                        password: passwordTextField.text ?? "",
                                        repeatPassword: repeatPasswordTextField.text ?? "")
        signupPresenter?.processUserSignup(formModel: formModel)
    }
}

extension SignupViewController: SignupView {
    func displayAlert(title: String, message: String, accessibilityIdentifier: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        DispatchQueue.main.async {
            alert.view.accessibilityIdentifier = accessibilityIdentifier
            self.present(alert, animated: true)
        }
    }
}
