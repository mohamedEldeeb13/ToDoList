//
//  toDoListView.swift
//  ToDoList
//
//  Created by Mohamed Abd Elhakam on 09/01/2024.
//

import SwiftUI
import FirebaseFirestoreSwift

struct toDoListView: View {
    //MARK: proparties
    @StateObject var viewModel : ToDoListviewViewModel
    private var userId : String
    @FirestoreQuery var items : [toDoListItem]
    
    init(userId: String) {
        self.userId = userId
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListviewViewModel(userId: userId)) 
    }
    //MARK: body
    var body: some View {
        NavigationView{
            VStack
            {
                List(items) { item in
                   toDoListItemView(item: item)
                        .swipeActions{
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(Color.red)
                        }
                }
                .listStyle(PlainListStyle())
                
            }//: Vstack
            .navigationTitle("To Do List")
            .toolbar{
                Button {
                    viewModel.showNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showNewItemView, content: {
                NewItemView(newItemPresented: $viewModel.showNewItemView)
               
            })
        }//: NavigationView
        
    }
}

#Preview {
    toDoListView(userId: "1")
}
