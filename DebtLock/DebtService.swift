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
        
    static func create(owedFrom: String, amount: String, debtDescription: String, dueDate: String) {
        
        let ref = Database.database().reference().child("debts").child(User.current.uid).childByAutoId()
        let debtID = ref.key
        let debt = Debt(id: debtID, owedFrom: owedFrom, amount: amount, description: debtDescription, dueDate: dueDate)
        ref.updateChildValues(debt.dictValue) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return
            }
        }
    }
    
    static func save(_ debt: Debt) {
        let ref = Database.database().reference().child("debts").child(User.current.uid).child(debt.id)
        ref.updateChildValues(debt.dictValue)
    }
    
    static func existingDebts(for user: User, completion: @escaping ([Debt]) -> Void) {
        let ref = Database.database().reference().child("debts").child(user.uid)
        
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let snapshot = snapshot.children.allObjects as? [DataSnapshot] else {
                return completion([])
            }
            
            let debts = snapshot.reversed().flatMap(Debt.init)
            completion(debts)
        })
    }
}

