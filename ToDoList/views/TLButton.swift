//
//  TLButton.swift
//  ToDoList
//
//  Created by Mohamed Abd Elhakam on 10/01/2024.
//

import SwiftUI

struct TLButton: View {
    //MARK: proparties
    var background : Color
    var title : String
    var action : ()-> Void
    //MARK: body
    var body: some View {
        Button {
            action()
        } label: {
            ZStack
            {
                RoundedRectangle(cornerRadius: 10).foregroundColor(background)
                Text(title)
                    .foregroundStyle(.white)
                    .bold()
            }
        }
    }
}

#Preview {
    TLButton(background: .blue, title: "Log In"){
        // login func
    }
}
