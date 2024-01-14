//
//  headerView.swift
//  ToDoList
//
//  Created by Mohamed Abd Elhakam on 10/01/2024.
//

import SwiftUI

struct headerView: View {
    //MARK: proparties
    var title : String
    var subTitle : String
    var angle : Double
    var background : Color
    //MARK: body
    var body: some View {
        ZStack
        {
            // first way
            
//            Color.blue
//                .rotationEffect(Angle(degrees: 15))
            
            // second way
            RoundedRectangle(cornerRadius: 0).foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
            VStack
            {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                Text(subTitle)
                    .font(.system(size: 30))
                    .foregroundStyle(.white)
                    
                
            }//: Vstack
            .padding(.top , 80)
            
        }//: Zstack
        .frame(width: UIScreen.main.bounds.width*3, height: 350)
        .offset(y: -150)
        
    }
}

#Preview {
    headerView(title: "title", subTitle: "subTitle", angle: 15, background: .pink)
}
