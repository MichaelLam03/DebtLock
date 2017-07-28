//
//  DisplayDebtViewController.swift
//  DebtLock
//
//  Created by Ji Yeon Kim on 24/7/2017.
//  Copyright © 2017 Michael Lam. All rights reserved.
//

import Foundation
import UIKit

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}

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
    
    func alert() {
        
        let alert = UIAlertController(title: "Error", message: "All fields must be filled", preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func savebuttontapped(_ sender: UIBarButtonItem) {
        
        
        if NameTextField.text?.isEmpty == false {
            print("ok")
            if descriptionTextView.text != "" {
                if dateDueTextField.text != "" {
                    if amountTextField.text != "" {
                        
                        if ((amountTextField.text)?.isInt)! {
                            
                            if let _ = self.debt {
                                debt!.owedFrom = NameTextField.text ?? ""
                                debt!.amount = amountTextField.text ?? ""
                                debt!.debtDescription = descriptionTextView.text ?? ""
                                
                                //if its their debt or not
                                
                                switch oweOption.selectedSegmentIndex{
                                case 0:
                                    MyDebtService.save(debt!)
                                    print("save")

                                    self.performSegue(withIdentifier: "saveMyDebt", sender: nil)
                                    
                                case 1:
                                    DebtService.save(debt!)
                                    self.performSegue(withIdentifier: "saveTheirDebt", sender: nil)
                                default:
                                    break
                                }
                                
                            } else {
                                
                                switch oweOption.selectedSegmentIndex{
                                case 0:
                                    MyDebtService.create(owedFrom: NameTextField.text!, amount: amountTextField.text!, debtDescription: descriptionTextView.text!, dueDate: dateDueTextField.text!)
                                    self.performSegue(withIdentifier: "saveMyDebt", sender: nil)
                                case 1:
                                    DebtService.create(owedFrom: NameTextField.text!, amount: amountTextField.text!, debtDescription: descriptionTextView.text!, dueDate: dateDueTextField.text!)
                                    self.performSegue(withIdentifier: "saveTheirDebt", sender: nil)
                                default:
                                    break
                                }
                            }
                            
                        } else {
                            let alert = UIAlertController(title: "Error", message: "Amount field must by integer only", preferredStyle: UIAlertControllerStyle.alert)
                            
                            // add an action (button)
                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                            
                            // show the alert
                            self.present(alert, animated: true, completion: nil)}
                }else {
                    alert()
                }
            }else {
                alert()
            }
        }else{
            alert()
            }
        }}



    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        switch oweOption.selectedSegmentIndex{
        case 0:
            self.performSegue(withIdentifier: "MyDebtCancel", sender: nil)
        case 1:
            self.performSegue(withIdentifier: "Cancel", sender: nil)
        default:
            break
        }
}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        switch oweOption.selectedSegmentIndex{
        case 0:
            if segue.identifier == Constants.Segue.saveMyDebt {
                if let debt = self.debt {
                    let _ = segue.destination as! MyDebtsTableViewController
                    //homeVC.debts.append(debt)
                    
                    print(debt)
                }
            }
        case 1:
            if segue.identifier == Constants.Segue.saveTheirDebt {
                if let debt = self.debt {
                    let _ = segue.destination as! DebtsTableViewController
                    //homeVC.debts.append(debt)
                    
                    print(debt)
                }
            }
        default:
            break
        }
        
}
}

    
    



