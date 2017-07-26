//
//  Debt.swit.swift
//  DebtLock
//
//  Created by Ji Yeon Kim on 26/7/2017.
//  Copyright © 2017 Michael Lam. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot


class Debts: NSObject {
    
    // MARK: - Properties
    
    let uid: String
    let name: String
    
    
    // MARK: - Init
    
    init(uid: String, name: String) {
        self.uid = uid
        self.name = name
    }
    
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let username = dict["name"] as? String
            else { return nil }
        
        self.uid = snapshot.key
        self.name = username
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        guard let uid = aDecoder.decodeObject(forKey: Constants.UserDefaults.uid) as? String,
            let name = aDecoder.decodeObject(forKey: Constants.UserDefaults.name) as? String
            else { return nil }
        
        self.uid = uid
        self.name = name
        
        super.init()
}
}
