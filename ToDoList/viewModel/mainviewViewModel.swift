//
//  mainviewViewModel.swift
//  ToDoList
//
//  Created by Mohamed Abd Elhakam on 09/01/2024.
//

import Foundation
import FirebaseAuth

class MainviewViewModel: ObservableObject {
    @Published var currentUserId : String = ""
    private var handel : AuthStateDidChangeListenerHandle?
    init() {
        self.handel = Auth.auth().addStateDidChangeListener {[weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    public var isSigned : Bool {
        return Auth.auth().currentUser != nil
    }
}
