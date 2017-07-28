//
//  constants.swift
//  DebtLock
//
//  Created by Ji Yeon Kim on 26/7/2017.
//  Copyright © 2017 Michael Lam. All rights reserved.
//

import Foundation

struct Constants {
    struct Segue {
        static let toCreateUsername = "toCreateUsername"
        static let displayDebt = "displayDebt"
        static let saveTheirDebt = "saveTheirDebt"
        static let saveMyDebt = "saveMyDebt"
        static let addDebt = "addDebt"
        static let displayMyDebt = "displayMyDebt"
    }
    
    struct UserDefaults {
        static let currentUser = "currentUser"
        static let uid = "uid"
        static let username = "username"
        static let name = "name"
    }
    
    struct DebtDefaults {
        static let id = "id"
        static let owedFrom = "owedFrom"
        static let amount = "amount"
        static let description = "description"
        static let dueDate = "dueDate"
    }
}
