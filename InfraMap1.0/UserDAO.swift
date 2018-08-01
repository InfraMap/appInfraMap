//
//  UserDAO.swift
//  InfraMap1.0
//
//  Created by student on 31/07/18.
//  Copyright © 2018 França. All rights reserved.
//

import Foundation

class UserDAO{
    
    static func createUser(user: User) {
        if (JSONSerialization.isValidJSONObject(user)){
            print("Sending data to server ...")
            let endpoint: String = ""
            guard let url = URL(string: endpoint) else {
                return print("Ërrooooo: Cannot create URL")
            }
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = user.toJSON()
            let task = URLSession.shared.dataTask(with: urlRequest)
            task.resume()
            
        } else {
            print("JSON object is invalid!")
        }
    }
}
