//
//  File.swift
//  PhotoApp
//
//  Created by Hakan Or on 10.05.2024.
//

import Foundation

struct SignupFormRequestModel: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
