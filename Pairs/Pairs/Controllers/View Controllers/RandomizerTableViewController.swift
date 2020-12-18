//
//  RandomizerTableViewController.swift
//  Pairs
//
//  Created by Nicholas Towery on 12/18/20.
//

import UIKit

class RandomizerTableViewController: UITableViewController {

    
    // MARK: - Properties
   
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        }
    }

    
    // MARK: - Actions
    
    @IBAction func randomButtonTapped(_ sender: Any) {
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        //return sections.count
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
