//
//  Person.swift
//  Pairs
//
//  Created by Nicholas Towery on 12/18/20.
//

import Foundation

class Person: Codable {
    let name: String
    var section: Int
    let uuid: String
    
    init(name: String, section: Int = 1, uuid: String = UUID().uuidString) {
        self.name = name
        self.section = section
        self.uuid = uuid
    }
    
}

extension Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        lhs.uuid == rhs.uuid
    }
    
}
