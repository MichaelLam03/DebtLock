//
//  Debt Service.swift
//  DebtLock
//
//  Created by Ji Yeon Kim on 25/7/2017.
//  Copyright © 2017 Michael Lam. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth.FIRUser

struct DebtService {
    
    func create() {
        let ref = Database.database().reference().child("DEBT").childByAutoId()

    }}
