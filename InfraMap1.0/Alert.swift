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
    var IDPhotoAlert: String
    var latitude: Double
    var longitude: Double
    var comments: [String]
    var status: Status
    
    init(user: User, IDPhotoAlert: String, latitude: Double, longitude: Double, comments: [String], status: Status) {
        self.user = user
        self.IDPhotoAlert = IDPhotoAlert
        self.latitude = latitude
        self.longitude = longitude
        self.comments = comments
        self.status = status
    }
    
}
