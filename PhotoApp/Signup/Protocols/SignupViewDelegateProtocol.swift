//
//  SignupViewDelegateProtocol.swift
//  PhotoApp
//
//  Created by Hakan Or on 15.05.2024.
//

import Foundation

protocol SignupViewDelegateProtocol: AnyObject {
    func successfullSignup()
    func errorHandler(error: SignupError)
}
