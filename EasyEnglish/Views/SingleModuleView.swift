//
//  SingleModuleView.swift
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
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fill)
            
            
            HStack {
                
                Image(image)
                    .resizable()
                    .frame(width: 64, height: 64)
                
                
                VStack(alignment: .leading, spacing: 7){
                    Text(title)
                        .font(.title)
                        .bold()
                    
                    Text(description)
                    
                }
                .padding(.leading, 20)
                    Spacer()
            }
            .padding(.horizontal, 20)
        }
    }
}

struct SingleModuleView_Previews: PreviewProvider {
    static var previews: some View {
        SingleModuleView(image: "timer", title: "English tenses", description: "")
    }
}
