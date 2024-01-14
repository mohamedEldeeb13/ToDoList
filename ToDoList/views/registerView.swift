//
//  registerView.swift
//  ToDoList
//
//  Created by Mohamed Abd Elhakam on 09/01/2024.
//

import SwiftUI

struct registerView: View {
    //MARK: proparties
   @StateObject var viewModel = registerviewViewModel()
    //MARK: body
    var body: some View {
        VStack
        {
            //MARK: Header
            headerView(title: "Register", subTitle: "Start organizing todos", angle: -15, background: .orange)
            
            //MARK: register form
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                TextField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                //MARK: to log in
                TLButton(background: .green, title: "Create Account") {
                    viewModel.signUp()
                    
                }
                .padding()
            }//: form
            
            
            
            
            Spacer()
            
        }//: Vstack
        
    }
}

#Preview {
    registerView()
}
