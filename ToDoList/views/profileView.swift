//
//  profileView.swift
//  ToDoList
//
//  Created by Mohamed Abd Elhakam on 09/01/2024.
//

import SwiftUI

struct profileView: View {
    //MARK: proparties
    @StateObject var viewModel = ProfileviewViewModel()
    //MARK: body
    var body: some View {
        NavigationView{
            VStack
            {
                
                if let user =  viewModel.userInfo {
                    
                    profile(user: user)
                    
            }else {
                Text("Loading page ...")
                    .bold()
            }
        }//: Vstack
                .navigationTitle("Profile")
        }//: NavigationView
        .onAppear(perform: {
            viewModel.fetchUser()
        })
    }
    
    
@ViewBuilder
    func profile(user : User) -> some View {
        //MARK: Image
        Image(systemName: "person.circle")
            .resizable()
            .scaledToFit()
            .foregroundStyle(Color.blue)
            .frame(width: 125, height: 125)
            .padding()
        
        //MARK: Info email , name , member
        VStack {
            HStack
            {
                Text("Name :")
                    .bold()
                Text(user.name)
            }
            .padding()
            
            HStack
            {
                Text("Email :")
                    .bold()
                Text(user.email)
            }
            .padding()
            
            HStack
            {
                Text("Member Since :")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
        }
        
        //MARK: sign out
        Button("Log Out") {
            viewModel.logOut()
        }
        .tint(.red)
        .padding()
        
        Spacer()

    }
}

#Preview {
    profileView()
}
