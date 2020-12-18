//
//  PersonController.swift
//  Pairs
//
//  Created by Nicholas Towery on 12/18/20.
//

import Foundation

class PersonController {
    
    static let shared = PersonController()
    
    var people: [Person]?
    
    //MARK: CRUD Methods
    
    func add(_ name: String) {
        people?.append((Person(name: name)))
        print("Successfully added \(name) to the array")
        saveToPersistence()
    }
    
    func delete(_ person: Person) {
        guard let index = people?.firstIndex(of: person) else {return}
        people?.remove(at: index)
        saveToPersistence()
    }
    
    // MARK: - Persistence
    func fileURL() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        let filename = "pairs.json"
        let fullURL = documentsDirectory.appendingPathComponent(filename)
        return fullURL
    }

    func saveToPersistence() {
        do {
            let data =  try JSONEncoder().encode(people)
            print(data)
            print(String(data: data, encoding: .utf8)!)
            try data.write(to: fileURL())
        } catch let error {
            print("Error saving people \(error)")
        }
    }

    func loadFromPersistence() {
        do {
            let data = try Data(contentsOf: fileURL())
            let decodedPeople = try JSONDecoder().decode([Person].self, from: data)
            self.people = decodedPeople
        } catch let error {
            print("Error loading data from disk \(error)")
        }
    }
}
