//
//  newItemviewViewModel.swift
//  ToDoList
//
//  Created by Mohamed Abd Elhakam on 09/01/2024.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class NewItemviewViewModel : ObservableObject {
    @Published var title : String = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init(){}
    
    func save(){
        guard canSave else {
            return
        }
        
        
        //MARK: get current user id
        
        guard let  uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        //MARK: create model
        let newId = UUID().uuidString
        let newItem = toDoListItem(id: newId, title: title, dueDate: dueDate.timeIntervalSince1970, createddate: Date().timeIntervalSince1970, isDone: false)
        
        //MARK: save model to fireStore
        let db = Firestore.firestore()
        db.collection("users").document(uid).collection("todos").document(newId).setData(newItem.asDictionary())
        
    }
    
    var canSave : Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
}
