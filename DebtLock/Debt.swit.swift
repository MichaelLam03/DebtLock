//
//  Debt.swit.swift
//  DebtLock
//
//  Created by Ji Yeon Kim on 26/7/2017.
//  Copyright © 2017 Michael Lam. All rights reserved.
//

import Foundation
import FirebaseDatabase

class Debts {
    
    var key: String?
    let title: String
    let memberHash: String
    let memberUIDs: [String]
    var lastMessage: String?
    var lastMessageSent: Date?
}
