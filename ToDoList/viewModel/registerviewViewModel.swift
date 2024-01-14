//
//  registerviewViewModel.swift
//  ToDoList
//
//  Created by Mohamed Abd Elhakam on 09/01/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class registerviewViewModel : ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    @Published var signUpSuccess : Bool = false
    init() {}
    
    func signUp() {
        guard validate() else {
            return
        }
        // try log In
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] result, error in
            
            guard let userId = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userId)
        }
        
        
        
        
    }
    
    private func insertUserRecord(id : String) {
        
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("users").document(id).setData(newUser.asDictionary())
        
    }
    
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all field"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter vailed email"
            return false
        }
        guard password.count >= 6 else {
            errorMessage = "Password should contain 6 carachters"
            return false
        }
        errorMessage = ""
        return true
        
        
    }
}
