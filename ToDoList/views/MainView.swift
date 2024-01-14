//
//  ContentView.swift
//  ToDoList
//
//  Created by Mohamed Abd Elhakam on 09/01/2024.
//

import SwiftUI

struct MainView: View {
    //MARK: proparties
    @StateObject var viewModel = MainviewViewModel()
    //MARK: body
    var body: some View {
        
        if viewModel.isSigned && !viewModel.currentUserId.isEmpty {
            AccountView
            
        }else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var AccountView : some View {
        TabView {
            toDoListView(userId: viewModel.currentUserId).tabItem {
                Label("Home", systemImage: "house")
            }
            profileView().tabItem {
                Label("Profile", systemImage: "person.circle")
            }
        }
    }
    
}



#Preview {
    MainView()
}
