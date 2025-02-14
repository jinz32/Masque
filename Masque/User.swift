//
//  User.swift
//  Masque
//
//  Created by Jason Zheng on 3/24/17.
//  Copyright © 2017 Jason Zheng. All rights reserved.
//

import Foundation
//class User: NSObject {
//    var facebook_id: String?
//    var name: String?
//}

class User: NSObject {
    var id: String?
    var name: String?
    var email: String?
    var profileImageUrl: String?
    init(dictionary: [String: AnyObject]) {
        self.id = dictionary["id"] as? String
        self.name = dictionary["name"] as? String
        self.email = dictionary["email"] as? String
        self.profileImageUrl = dictionary["profileImageUrl"] as? String
    }
}

