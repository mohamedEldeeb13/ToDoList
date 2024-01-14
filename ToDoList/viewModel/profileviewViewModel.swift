//
//  profileviewViewModel.swift
//  ToDoList
//
//  Created by Mohamed Abd Elhakam on 09/01/2024.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class ProfileviewViewModel : ObservableObject {
    init(){}
    @Published var userInfo : User? = nil
    
    func fetchUser() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let db = Firestore.firestore()
        db.collection("users").document(uid).getDocument {[weak self] snapshot, error in
            guard let data = snapshot?.data() , error == nil  else{return}
            DispatchQueue.main.async {
                self?.userInfo = User(id: data["id"] as? String ?? "",
                                       name: data["name"] as? String ?? "",
                                       email: data["email"] as? String ?? "",
                                       joined: data["joined"] as? TimeInterval ?? 0)
            }
            
        }
    }
    func logOut()  {
        
        do {
           try Auth.auth().signOut()
        }catch {
            print(error.localizedDescription)
        }
        
    }
   
}
