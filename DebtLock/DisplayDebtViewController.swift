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
    
    
    @IBOutlet weak var oweOption: UISegmentedControl!
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    
    @IBOutlet weak var descriptionTextView: UITextField!
    
    @IBOutlet weak var dateDueTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NameTextField.text = debt?.owedFrom
        amountTextField.text = debt?.amount
        descriptionTextView.text = debt?.debtDescription
        dateDueTextField.text =  debt?.dueDate
        
    }
    
    
    var debt : Debt?
    
    @IBAction func savebuttontapped(_ sender: UIBarButtonItem) {
        
        
        if let _ = self.debt {
            debt!.owedFrom = NameTextField.text ?? ""
            debt!.amount = amountTextField.text ?? ""
            debt!.debtDescription = descriptionTextView.text ?? ""
            DebtService.save(debt!)
            self.performSegue(withIdentifier: "saveTheirDebt", sender: nil)
        } else {
            DebtService.create(owedFrom: NameTextField.text!, amount: amountTextField.text!, debtDescription: descriptionTextView.text!, dueDate: dateDueTextField.text!)
            self.performSegue(withIdentifier: "saveTheirDebt", sender: nil)
        }
        
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        
        self.performSegue(withIdentifier: "Cancel", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Constants.Segue.saveTheirDebt {
            if let debt = self.debt {
                let homeVC = segue.destination as! DebtsTableViewController
                //homeVC.debts.append(debt)
                
                print(debt)
            }
        }
    }
    
    
    
}


