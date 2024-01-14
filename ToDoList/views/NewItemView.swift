//
//  NewItemView.swift
//  ToDoList
//
//  Created by Mohamed Abd Elhakam on 09/01/2024.
//

import SwiftUI

struct NewItemView: View {
    //MARK: proparties
   @StateObject var viewModel = NewItemviewViewModel()
    @Binding var newItemPresented : Bool
    //MARK: body
    var body: some View {
        VStack
        {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top , 100)
            Form {
                //MARK: title
                TextField("title" , text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                //MARK: due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                //MARK: button
                TLButton(background: .pink, title: "New") {
                    
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    }else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
                
            }//: form
            .alert(isPresented: $viewModel.showAlert){
                Alert(title: Text("Error"), message: Text("Please fill in all field and select due date that is today or newer"))
            }
        }//: Vstack
    }
}

#Preview {
    NewItemView( newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
