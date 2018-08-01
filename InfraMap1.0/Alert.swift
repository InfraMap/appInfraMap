//
//  Alert.swift
//  InfraMap1.0
//
//  Created by student on 30/07/18.
//  Copyright © 2018 França. All rights reserved.
//

import Foundation

class Alert {
    var user: User
    var photoAlert: String
    var type: Type
    var latitude: Double
    var longitude: Double
    
    init(user: User, photoAlert: String, type: Type, latitude: Double, longitude: Double, comments: [String]) {
        self.user = user
        self.photoAlert = photoAlert
        self.type = type
        self.latitude = latitude
        self.longitude = longitude
    }
    
    func toJSON() -> Data {
        let dataDict: [String: Any] = [
            "user": user.toJSON(),
            "photo_alert": photoAlert,
            "type": type,
            "latitude": latitude,
            "longitude": longitude,
            
        ]
        
        return try! JSONSerialization.data(withJSONObject: dataDict)
    }
    
}
