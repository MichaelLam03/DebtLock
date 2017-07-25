//
//  User.swift
//  DebtLock
//
//  Created by Ji Yeon Kim on 25/7/2017.
//  Copyright © 2017 Michael Lam. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot


class User {
    
    // MARK: - Properties
    
    let uid: String
    let username: String
    
    // MARK: - Init
    
    init(uid: String, username: String) {
        self.uid = uid
        self.username = username
    }
    
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let username = dict["username"] as? String
            else { return nil }
        
        self.uid = snapshot.key
        self.username = username
    }
    
    
    
}
