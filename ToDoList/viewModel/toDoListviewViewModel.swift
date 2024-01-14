//
//  toDoListviewViewModel.swift
//  ToDoList
//
//  Created by Mohamed Abd Elhakam on 09/01/2024.
//

import Foundation
import SwiftUI
import FirebaseFirestore

/// view model for list of item view
/// primary tab

class ToDoListviewViewModel : ObservableObject {
    @Published var showNewItemView : Bool = false
   private let userId : String
    init(userId : String){
        self.userId = userId
    }
    func delete(id : String){
        let db = Firestore.firestore()
        db.collection("users").document(userId).collection("todos").document(id).delete()
        
    }
}
