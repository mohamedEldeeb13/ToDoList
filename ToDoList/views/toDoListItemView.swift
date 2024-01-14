//
//  toDoListItemView.swift
//  ToDoList
//
//  Created by Mohamed Abd Elhakam on 09/01/2024.
//

import SwiftUI

struct toDoListItemView: View {
    //MARK: proparties
    @StateObject var viewModel = ToDoListItemviewViewModel()
    let item : toDoListItem
    //MARK: body
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(Color(.secondaryLabel))
            }//: Vstack
            
            Spacer()
            Button{
                //action
                viewModel.toggleIsDone(item: item)
            }label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.blue)
            }

        }//: Hstack
        .padding()
        
        
    }
}

#Preview {
    toDoListItemView(item: toDoListItem(id: "cc", title: "Get Milk", dueDate: Date().timeIntervalSince1970, createddate: Date().timeIntervalSince1970, isDone: true))
}
