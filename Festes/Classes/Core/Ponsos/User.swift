//
//  User.swift
//  Festes
//
//  Created by Carlos Roig on 01/08/16.
//  Copyright © 2016 Festes. All rights reserved.
//

import UIKit
import CoreLocation

class User: NSObject {
    
    let userId : String
    let email : String
    let password : String
    
    override init() {
        self.userId = ""
        self.email = ""
        self.password = ""
    }

    init(userId : String, email : String, password : String) {
        self.userId = userId
        self.email = email
        self.password = password
    }
    
}
