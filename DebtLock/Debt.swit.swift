//
//  Debt.swit.swift
//  DebtLock
//
//  Created by Ji Yeon Kim on 26/7/2017.
//  Copyright © 2017 Michael Lam. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot


class Debt {
    
    // MARK: - Properties
    
    let id: String
    let owedFrom: String
    let amount: String
    let debtDescription: String
    let dueDate: String
    
    var dictValue: [String: String] {
        let dict = [Constants.DebtDefaults.owedFrom: owedFrom,
                    Constants.DebtDefaults.amount: amount,
                    Constants.DebtDefaults.description: debtDescription,
                    Constants.DebtDefaults.dueDate: dueDate]
        return dict
    }
    
    
    // MARK: - Init
    
    init(id: String, owedFrom: String, amount: String, description: String, dueDate: String) {
        self.id = id
        self.owedFrom = owedFrom
        self.amount = amount
        self.dueDate = dueDate
        self.debtDescription = description
    }
    
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let owedFrom = dict[Constants.DebtDefaults.owedFrom] as? String,
            let amount = dict[Constants.DebtDefaults.amount] as? String,
            let description = dict[Constants.DebtDefaults.description] as? String,
            let dueDate = dict[Constants.DebtDefaults.dueDate] as? String
            else { return nil }
        
        self.id = snapshot.key
        self.owedFrom = owedFrom
        self.amount = amount
        self.dueDate = dueDate
        self.debtDescription = description
    }
    
    /*
    required init?(coder aDecoder: NSCoder) {
        guard let uid = aDecoder.decodeObject(forKey: Constants.UserDefaults.uid) as? String,
            let owedTo = aDecoder.decodeObject(forKey: Constants.UserDefaults.name) as? String
            else { return nil }
        
        self.id = uid
        self.owedTo = owedTo
        
        super.init()
    }*/
}
