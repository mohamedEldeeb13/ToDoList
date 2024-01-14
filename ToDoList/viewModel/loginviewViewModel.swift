//
//  loginviewViewModel.swift
//  ToDoList
//
//  Created by Mohamed Abd Elhakam on 09/01/2024.
//

import Foundation
import FirebaseAuth

class LoginviewViewModel : ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func logIn() {
        guard validate() else {
            return
        }
        // try log In
        Auth.auth().signIn(withEmail: email, password: password)
        
        
        
        
    }
    
    
   private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty , !password.trimmingCharacters(in: .whitespaces).isEmpty else {
             errorMessage = "Please fill in all field"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter vailed email"
            return false
        }
       guard password.count >= 6 else {
           errorMessage = "Please enter vailed password"
           return false
       }
       errorMessage = ""
       return true
       

    }
}
