//
//  DisplayDebtViewController.swift
//  DebtLock
//
//  Created by Ji Yeon Kim on 24/7/2017.
//  Copyright © 2017 Michael Lam. All rights reserved.
//

import Foundation
import UIKit
/*
class DisplayDebtViewController : UIViewController {
    var note: Note?
    
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
            let note = self.note ?? CoreDataHelper.createNote()
            
            note.title = debtTitleTextField.text ?? ""
            note.amount = AmountTextField.text ?? nil
            note.duedate = DateDueTextField.text ?? nil
            note.content = DebtContentTextView.text ?? ""
            note.modificationTime = Date() as NSDate
            CoreDataHelper.saveNote()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 1
        
        if let note = note {
            
            // 2
            debtTitleTextField.text = note.title
            AmountTextField.text = note.amount
            DebtContentTextView.text = note.content
            DateDueTextField.text = note.duedate
           
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


