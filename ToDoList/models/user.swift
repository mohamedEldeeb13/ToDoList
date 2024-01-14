//
//  user.swift
//  ToDoList
//
//  Created by Mohamed Abd Elhakam on 09/01/2024.
//

import Foundation

struct User : Codable {
    let id : String
    let name : String
    let email : String
    let joined : TimeInterval
}
