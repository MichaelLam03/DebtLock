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
    
    static func create(owedFrom: String, amount: String, debtDescription: String, dueDate: String, completion: @escaping (Debt?) -> Void) {
        
        let ref = Database.database().reference().child("debts").child(User.current.uid).childByAutoId()
        let debtID = ref.key
        let debt = Debt(id: debtID, owedFrom: owedFrom, amount: amount, description: debtDescription, dueDate: dueDate)
        ref.setValue(debt) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
            completion(debt)
        }
    }
}

