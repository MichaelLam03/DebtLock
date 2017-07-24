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
    var note: Note?
    
    @IBOutlet weak var DebtContentTextView: UITextView!
    @IBOutlet weak var debtTitleTextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "save" {
            // if note exists, update title and content
            let note = self.note ?? CoreDataHelper.createNote()
            note.title = debtTitleTextField.text ?? ""
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
            DebtContentTextView.text = note.content
        } else{
            // 3
            debtTitleTextField.text = ""
            DebtContentTextView.text = ""
        }
    }
}


    


