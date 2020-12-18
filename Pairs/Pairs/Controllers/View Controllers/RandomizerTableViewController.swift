//
//  RandomizerTableViewController.swift
//  Pairs
//
//  Created by Nicholas Towery on 12/18/20.
//

import UIKit

class RandomizerTableViewController: UITableViewController {

    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        }



    // MARK: - Actions
    @IBAction func randomButtonTapped(_ sender: Any) {
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
       addPersonAlert()

    }
    
    //MARK: - Methods
    func addPersonAlert(){
        let alertController = UIAlertController(title: "Add Person", message: "Add someone new to the list" , preferredStyle: .alert)
        
        let addAction = UIAlertAction(title: "Add", style: .default) { (_) in
            let textField = alertController.textFields?.first
            guard let name = textField?.text, !name.isEmpty else {return}
            PersonController.shared.add(name)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        alertController.addAction(cancelAction)
        alertController.addAction(addAction)
        alertController.addTextField { (textfield) in
            textfield.placeholder = "Name"
        }
        
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Table view data sourc
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)

        // Configure the cell...

        return cell
    }
    


    

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

 

} //End of class
