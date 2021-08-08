//
//  ModulesListView.swift
//  EasyEnglish
//
//  Created by Kurbatov Artem on 23.06.2021.
//

import SwiftUI

struct SingleModuleView: View {
    
    var image: String
    var title: String
    var description: String
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 100), contentMode: .fit)
            
            HStack {
                
                Image(image)
                    .resizable()
                    .frame(width: 64, height: 64)
                
                VStack (alignment: .leading, spacing: 10) {
                    
                    Text(title)
                        .font(.title2)
                        .bold()
                    
                    Text(description)
                        .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                }
                .padding(.leading, 20)
                
                Spacer()
            }
            .padding(.horizontal, 20)
        }
        .padding(.top, 7)
        .padding(.horizontal, 10)
    }
}

struct SingleModuleView_Previews: PreviewProvider {
    static var previews: some View {
        SingleModuleView(image: "timer", title: "Hi", description: "ho")
    }
}
