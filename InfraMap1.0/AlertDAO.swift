//
//  AlertDAO.swift
//  InfraMap1.0
//
//  Created by student on 31/07/18.
//  Copyright © 2018 França. All rights reserved.
//

import Foundation

class AlertDAO {
    
    static func create(alert: Alert) {
            print("Sending data to server ...")
            let endpoint: String = "https://persistinframapdf.mybluemix.net/create"
            guard let url = URL(string: endpoint) else {
                return print("Ërrooooo: Cannot create URL")
            }
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = alert.toJSON()
            let task = URLSession.shared.dataTask(with: urlRequest)
            task.resume()
    }
}
    
