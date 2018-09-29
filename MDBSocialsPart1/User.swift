//
//  User.swift
//  MDBSocialsPart1
//
//  Created by Anika Bagga on 9/28/18.
//  Copyright © 2018 Anika Bagga. All rights reserved.
//

import Foundation
import UIKit


class User{

    var uid : String!
    var name : String!
    var username : String!
    var email : String!
    
    init(_ uid: String, _ name: String, _ username : String, _ email: String) {
        self.uid = uid
        self.name = name
        self.username = username
        self.email = email
    }
}

