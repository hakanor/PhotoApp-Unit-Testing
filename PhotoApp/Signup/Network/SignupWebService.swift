//
//  SignupWebService.swift
//  PhotoApp
//
//  Created by Hakan Or on 10.05.2024.
//

import Foundation

class SignupWebService: SignupWebServiceProtocol {
    
    var urlSession: URLSession
    private var urlString: String

    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func signup(withForm formModel: SignupFormRequestModel, completion: @escaping ((SignupResponseModel?, SignupError?) -> Void)) {
        guard let url = URL(string: urlString) else {
            completion(nil, SignupError.invalidRequestURLString)
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        request.httpBody = try? JSONEncoder().encode(formModel)
        
        let dataTask = urlSession.dataTask(with: request) { (data, response, error) in
            
            if let requestError = error {
                completion(nil, SignupError.failedRequest(description: requestError.localizedDescription))
                return
            }
            
            if let data = data, let signupResponseModel = try? JSONDecoder().decode(SignupResponseModel.self, from: data) {
                completion(signupResponseModel, nil)
            } else {
                completion(nil, SignupError.invalidResponseModel)
                
            }
        }
        
        dataTask.resume()
    }
    
}
