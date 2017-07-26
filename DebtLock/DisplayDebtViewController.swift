//
//  DisplayDebtViewController.swift
//  DebtLock
//
//  Created by Ji Yeon Kim on 24/7/2017.
//  Copyright © 2017 Michael Lam. All rights reserved.
//

import Foundation
import UIKit

class DisplayDebtViewController : UIViewController {
    
}
 
 /*

class DisplayDebtViewController : UIViewController {
    var debt: Debt?
    
    @IBOutlet weak var DebtContentTextView: UITextView!
    @IBOutlet weak var debtTitleTextField: UITextField!
    @IBOutlet weak var AmountTextField: UITextField!
    @IBOutlet weak var DateDueTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
        
        if segue.identifier == "save" {
            
            
            
            // if note exists, update title and content
           // let note = self.note ?? CoreDataHelper.createNote()
            
            debt.title = debtTitleTextField.text ?? ""
            debt.amount = AmountTextField.text ?? nil
            debt.duedate = DateDueTextField.text ?? nil
            debt.content = DebtContentTextView.text ?? ""
            debt.modificationTime = Date() as NSDate
//            CoreDataHelper.saveNote()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 1
        
        if let debt = debt {
            
            // 2
            debtTitleTextField.text = debt.title
            AmountTextField.text = debt.amount
            DebtContentTextView.text = debt.content
            DateDueTextField.text = debt.duedate
           
        } else{
            // 3
            debtTitleTextField.text = ""
            AmountTextField.text = nil
            DebtContentTextView.text = ""
            DateDueTextField.text = nil
           
        }
    }
}
*/

