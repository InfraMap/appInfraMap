//
//  Alert.swift
//  InfraMap1.0
//
//  Created by student on 30/07/18.
//  Copyright © 2018 França. All rights reserved.
//

import Foundation

class Alert {
    var photoAlert: String
    var latitude: Double
    var longitude: Double
    
    init(photoAlert: String, latitude: Double, longitude: Double) {
        self.photoAlert = photoAlert
        self.latitude = latitude
        self.longitude = longitude
    }
    
    func toJSON() -> Data {
        let dataDict: [String: Any] = [
            "photo_alert": photoAlert,
            "latitude": latitude,
            "longitude": longitude,
        ]
        
        return try! JSONSerialization.data(withJSONObject: dataDict)
    }
    
}
