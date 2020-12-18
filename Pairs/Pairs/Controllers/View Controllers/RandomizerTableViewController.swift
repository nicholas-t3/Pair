//
//  RandomizerTableViewController.swift
//  Pairs
//
//  Created by Nicholas Towery on 12/18/20.
//

import UIKit

class RandomizerTableViewController: UITableViewController {
    
    // MARK: - Properties
    var groupOnePeople: [Person] = []
    var groupTwoPeople: [Person] = []
    var groupThreePeople: [Person] = []
    var groupFourPeople: [Person] = []
    var data = [[Person]]()
    let headerTitles = ["Group 1", "Group 2", "Group 3", "Group 4"]
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        PersonController.shared.loadFromPersistence()
        loadPeople()
    }
    
    // MARK: - Actions
    @IBAction func randomButtonTapped(_ sender: Any) {
        randomizePeople()
        loadPeople()
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        addPersonAlert()
    }
    
    //MARK: - Methods
    func randomizePeople(){
        for person in PersonController.shared.people {
            let number = Int.random(in: 1...4)
            person.section = number
        }
        PersonController.shared.saveToPersistence()
        loadPeople()
    }
    
    func clearData(){
        groupOnePeople = []
        groupTwoPeople = []
        groupThreePeople = []
        groupFourPeople = []
    }
    
    func loadPeople() {
        clearData()
        data = []
        for person in PersonController.shared.people {
            if person.section == 1 {
                groupOnePeople.append(person)
            } else if person.section == 2 {
                groupTwoPeople.append(person)
            }
            else if person.section == 3 {
                groupThreePeople.append(person)
            }
            else if person.section == 4 {
                groupFourPeople.append(person)
            }
            
        }
        data.append(groupOnePeople)
        data.append(groupTwoPeople)
        data.append(groupThreePeople)
        data.append(groupFourPeople)
        tableView.reloadData()
    }
    

    func addPersonAlert(){
        let alertController = UIAlertController(title: "Add Person", message: "Add someone new to the list" , preferredStyle: .alert)
        
        let addAction = UIAlertAction(title: "Add", style: .default) { (_) in
            let textField = alertController.textFields?.first
            guard let name = textField?.text, !name.isEmpty else {return}
            PersonController.shared.add(name)
            self.loadPeople()
            self.tableView.reloadData()
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
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < headerTitles.count {
            return headerTitles[section]
        }
        return nil
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        
        let person = data[indexPath.section][indexPath.row]
        cell.textLabel?.text = person.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let person = data[indexPath.section][indexPath.row]
            PersonController.shared.delete(person)
            let index = indexPath.row
            data[indexPath.section].remove(at: index)
            loadPeople()
        }
    }
    
} //End of class
