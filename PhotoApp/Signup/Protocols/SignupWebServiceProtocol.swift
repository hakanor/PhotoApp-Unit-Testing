//
//  SignupWebServiceProtocol.swift
//  PhotoApp
//
//  Created by Hakan Or on 15.05.2024.
//

import Foundation

protocol SignupWebServiceProtocol {
    func signup(withForm formModel: SignupFormRequestModel, completion: @escaping ((SignupResponseModel?, SignupError?) -> Void))
}
