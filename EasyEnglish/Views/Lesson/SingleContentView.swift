//
//  SingleContentView.swift
//  EasyEnglish
//
//  Created by Kurbatov Artem on 05.07.2021.
//

import SwiftUI

struct SingleContentView: View {
    
    @EnvironmentObject var model: ContentModel
    var index: Int
    
    var lesson: Lesson {
        
        if model.currentModule != nil && index < model.currentModule!.content.lessons.count {
            return model.currentModule!.content.lessons[index]
        }
        else {
            return Lesson(id: 0, title: "", explanation: "")
        }
    }
    
    var body: some View {
        
        ZStack(alignment: .leading){
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(height: 66)
            
            HStack{
                
                Text(String(index+1))
                    .bold()
                
                VStack(alignment: .leading){
                    Text(lesson.title)
                        .bold()
                }
            }
            .padding(.leading, 10)
        }
        .padding(.bottom, 10)
    }
}

