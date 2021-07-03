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
            //ScrollView{
              //  Text(lesson?.explanation ?? "")
            ContentDescriptionView()
            //}
            
            if model.hasNextLesson(){
                
                Button(action: {
                    model.nextLesson()
                }, label: {
                    
                    ZStack{
                        
                        Rectangle()
                            .frame(height: 48)
                            .foregroundColor(.green)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
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
        
    }
}
