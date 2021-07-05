//
//  SingleTestView.swift
//  EasyEnglish
//
//  Created by Kurbatov Artem on 04.07.2021.
//

import SwiftUI

struct SingleTestView: View {
    
    var title: String
    
    var body: some View {
        
        LazyVStack {
            ZStack{
                Rectangle()
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .aspectRatio(CGSize(width: 335, height: 50), contentMode: .fit)
                
                Text(title)
                    .foregroundColor(.black)
                    .font(.title2)
                    .bold()
            }
            .padding(.top, 7)
            .padding(.horizontal, 10)
        }
    }
}

struct SingleTestView_Previews: PreviewProvider {
    static var previews: some View {
        SingleTestView(title: "Hi")
    }
}
