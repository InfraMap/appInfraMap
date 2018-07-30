//
//  User.swift
//  InfraMap1.0
//
//  Created by student on 30/07/18.
//  Copyright © 2018 França. All rights reserved.
//

import Foundation

class User {
    var name: String = "Sem nome"
    var email: String = "Sem email"
    var password: String = ""
    
    init(name: String, email: String, password: String) {
        self.name = name
        self.email = email
        self.password = password
    }
}
