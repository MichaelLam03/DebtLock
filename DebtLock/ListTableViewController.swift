//
//  ListTableViewController.swift
//  DebtLock
//
//  Created by Ji Yeon Kim on 24/7/2017.
//  Copyright © 2017 Michael Lam. All rights reserved.
//

import Foundation
import UIKit

class ListTableViewController: UITableViewController {
    
    var notes = [Note]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notes = CoreDataHelper.retrieveNotes()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
        
        // 1
        let row = indexPath.row
        
        // 2
        let note = notes[row]
        
        // 3
        cell.NameTitleLabel.text = note.title
        
        // 4
        cell.DueDateLabel.text = note.modificationTime?.convertToString()
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "DisplayDebt" {
                print("Table view cell tapped")
                
                // 1
                let indexPath = tableView.indexPathForSelectedRow!
                // 2
                let note = notes[indexPath.row]
                // 3
                let displayNoteViewController = segue.destination as! DisplayDebtViewController
                // 4
                displayNoteViewController.note = note
                
            } else if identifier == "addDebt" {
                print("+ button tapped")
            }
        }
    }

    
    @IBAction func unwindToListNotesViewController(_ segue: UIStoryboardSegue) {
        
        self.notes = CoreDataHelper.retrieveNotes()
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //1
            CoreDataHelper.delete(note: notes[indexPath.row])
            //2
            notes = CoreDataHelper.retrieveNotes()
        }
    }

    
    
}


