//
//  Debt Service.swift
//  DebtLock
//
//  Created by Ji Yeon Kim on 25/7/2017.
//  Copyright © 2017 Michael Lam. All rights reserved.
//

import Foundation
import FirebaseAuth.FIRUser
import FirebaseDatabase

struct DebtService {
    
        static func create(_ firUser: FIRUser, name: String, completion: @escaping (User?) -> Void) {
        let userAttrs = ["name": name]
        
        let ref = Database.database().reference().child("debts")
        ref.setValue(userAttrs) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
            
            
            }}}

