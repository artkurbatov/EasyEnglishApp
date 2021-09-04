//
//  ContentDetailView.swift
//  EasyEnglish
//
//  Created by Kurbatov Artem on 03.07.2021.
//

import SwiftUI

struct ContentDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        VStack{
            
            ContentDescriptionView()
            
            if model.hasNextLesson(){
                Button(action: {
                    model.nextLesson()
                }, label: {
                    ZStack{
                        
                        Rectangle()
                            .foregroundColor(.green)
                            .cornerRadius(10)
                            .shadow(radius: 1)
                            .frame(height: 48)
                        
                        Text("Далее: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                            .foregroundColor(.white)
                            .bold()
                    }
                })
            }
            else{
                Button(action: {
                    model.nextLesson()
                    model.currentContentSelected = nil
                }, label: {
                    ZStack{
                        Rectangle()
                            .foregroundColor(.green)
                            .cornerRadius(10)
                            .shadow(radius: 1)
                            .frame(height: 48)
                        
                        Text("Завершить")
                            .foregroundColor(.white)
                            .bold()
                    }
                })
            }
        }
        .padding()
        .navigationBarTitle(model.currentLesson?.title ?? "")
    }
}


struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
            .environmentObject(ContentModel())
        
    }
}
