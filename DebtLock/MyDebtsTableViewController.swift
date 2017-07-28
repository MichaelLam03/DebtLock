//
//  MyDebtsTableViewController.swift
//  DebtLock
//
//  Created by Ji Yeon Kim on 28/7/2017.
//  Copyright © 2017 Michael Lam. All rights reserved.
//

import UIKit
import FirebaseDatabase


import FirebaseAuth.FIRUser

class MyDebtsTableViewController: UITableViewController {
    
    
    @IBOutlet weak var myDebtTotalAmountLabel: UILabel!
   
   
    var debts = [Debt]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    func total() -> Int{
        var countAmount = 0
        for x in debts{
            countAmount += Int(x.amount)!
        }
        
        return countAmount
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        myDebtTotalAmountLabel.text = "Total: $\(String(total()))"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        MyDebtService.existingDebts(for: User.current, completion: { debts in
            self.debts = debts
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(debts.count)
        self.viewDidLoad()
        return debts.count
        
        
    }
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell") as? ListTableViewCell else {
     fatalError("No such cell!")
     }
     
     return cell
     }
     */
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyDebtTableViewCell", for: indexPath) as! MyDebtsTableViewCell
        
        let row = indexPath.row
        
        let debt = debts[row]
        
        cell.MyDebtNameTitleLabel.text = debt.owedFrom
        
        cell.MyDebtAmountLabel.text = debt.amount
        
        cell.MyDebtDueDateLabel.text = debt.dueDate
        
        return cell
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == Constants.Segue.displayMyDebt {
                if let indexPath = tableView.indexPathForSelectedRow {
                    let debt = debts[indexPath.row]
                    let homeVC = segue.destination as! DisplayDebtViewController
                    homeVC.debt = debt
                }
            } else if identifier == Constants.Segue.addDebt {
                
                print("+ button tapped")
                
            }
        }
    }
    
    @IBAction func unwindToMyDebt(_ segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func unwindToMyDebtCancel(_ segue: UIStoryboardSegue) {
        
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //1
            let debt = debts[indexPath.row]
            Database.database().reference().child("Mydebts").child(User.current.uid).child(debt.id).setValue(nil)
            self.viewDidLoad()
            viewDidAppear(true)
            
        }
}
}


