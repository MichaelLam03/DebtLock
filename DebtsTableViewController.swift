//
//  DebtsTableViewController.swift
//  DebtLock
//
//  Created by Ji Yeon Kim on 25/7/2017.
//  Copyright © 2017 Michael Lam. All rights reserved.
//

import UIKit
import FirebaseDatabase


import FirebaseAuth.FIRUser

class DebtsTableViewController: UITableViewController {
    
    @IBOutlet var table: UITableView!
    @IBOutlet weak var totalAmountLabel: UILabel!
    
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
        
        
        totalAmountLabel.text = "Total: $\(String(total()))"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DebtService.existingDebts(for: User.current, completion: { debts in
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
        
        let row = indexPath.row
        
        let debt = debts[row]
        
        cell.nameTitleLabel.text = debt.owedFrom
        
        cell.amountLabel.text = debt.amount
        
        cell.dateDueLabel.text = debt.dueDate
        
        return cell
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == Constants.Segue.displayDebt {
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
    
    @IBAction func unwindToHome(_ segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func unwindToHomeCancel(_ segue: UIStoryboardSegue) {
        
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //1
            let debt = debts[indexPath.row]
            Database.database().reference().child("debts").child(User.current.uid).child(debt.id).setValue(nil)
            self.viewDidLoad()
            viewDidAppear(true)

        }
    }
    
    
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
