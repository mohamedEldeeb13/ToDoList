//
//  toDoListItemviewViewModel.swift
//  ToDoList
//
//  Created by Mohamed Abd Elhakam on 09/01/2024.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseFirestore
/// view model for single to do list item(each row of items list)

class ToDoListItemviewViewModel : ObservableObject {
    init(){}
    
    func toggleIsDone(item : toDoListItem) {
        var newItem = item
        newItem.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid  else {
            return
        }
            let db = Firestore.firestore()
        db.collection("users").document(uid).collection("todos").document(item.id).setData(newItem.asDictionary())
            
        
        
    }
    
}
