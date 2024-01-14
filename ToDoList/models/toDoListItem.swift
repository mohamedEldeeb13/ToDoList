//
//  toDoList.swift
//  ToDoList
//
//  Created by Mohamed Abd Elhakam on 09/01/2024.
//

import Foundation

struct toDoListItem : Codable , Identifiable {
    let id : String
    let title : String
    let dueDate : TimeInterval
    let createddate : TimeInterval
    var isDone : Bool
    
    mutating func setDone(_ state : Bool) {
        isDone = state
    }
}
