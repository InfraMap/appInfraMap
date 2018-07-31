//
//  Comment.swift
//  InfraMap1.0
//
//  Created by student on 31/07/18.
//  Copyright © 2018 França. All rights reserved.
//

import Foundation

class Comment {
    var user: User
    var alert: Alert
    var text: String
    
    init(user: User, alert: Alert, text: String) {
        self.user = user
        self.alert = alert
        self.text = text
    }
    
    func toJSON() -> Data {
        let dataDict: [String: Any] = [
            "user": user.toJSON(),
            "alert": alert.toJSON(),
            "text": text
            ]
        
        return try! JSONSerialization.data(withJSONObject: dataDict)
    }
    
}
