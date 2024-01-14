//
//  LoginView.swift
//  ToDoList
//
//  Created by Mohamed Abd Elhakam on 09/01/2024.
//

import SwiftUI

struct LoginView: View {
    //MARK: proparties
    @StateObject var ViewModel = LoginviewViewModel()
    //MARK: body
    var body: some View {
        
        NavigationView {
            
            VStack
            {
                //MARK: Header
                headerView(title: "To Do List", subTitle: "Get things done", angle: 15, background: .pink)
                
                //MARK: login form
                Form {
                    if !ViewModel.errorMessage.isEmpty {
                        Text(ViewModel.errorMessage)
                            .foregroundStyle(.red)
                    }
                    
                    TextField("Email Address", text: $ViewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("Password", text: $ViewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(background: .blue, title: "Log In"){
                        // login func
                        ViewModel.logIn()
                    }
                    .padding()
                }//: Form
                
                
                .cornerRadius(20)
                .padding(.horizontal , 5)
                .offset(y: -50)
                
                //MARK: create account
                
                VStack
                {
                    Text("New arround here")
                    NavigationLink("Create An Account", destination: registerView())
                }//:Vstack
                .padding(.bottom , 50)
                
                
                Spacer()
            }
        
    }//: navigationView
}
}


#Preview {
    LoginView()
}
