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
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var oweOption: UISegmentedControl!
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    
    @IBOutlet weak var descriptionTextView: UITextField!
   
    @IBOutlet weak var dateDueTextField: UITextField!
    
    var debt: Debt?
    
    @IBAction func savebuttontapped(_ sender: UIBarButtonItem) {
        
        DebtService.create(owedFrom: NameTextField.text!, amount: amountTextField.text!, debtDescription: descriptionTextView.text!, dueDate: dateDueTextField.text!, completion: { debt in
            if let debt = debt {
                self.debt = debt
                self.performSegue(withIdentifier: "saveTheirDebt", sender: nil)
            }
        })
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
        
        if segue.identifier == "saveTheirDebt" {
            if let debt = self.debt {
                let homeVC = segue.destination as! DebtsTableViewController
                homeVC.debts.append(debt)
            }
        }
    }
}

