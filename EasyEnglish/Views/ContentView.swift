//
//  ContentView.swift
//  EasyEnglish
//
//  Created by Kurbatov Artem on 23.06.2021.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        ScrollView{
            
            LazyVStack {

                if model.currentModule != nil {
                    ForEach(0..<model.currentModule!.content.lessons.count) { index in

                        let lesson = model.currentModule!.content.lessons[index]

                        NavigationLink(
                            destination: ContentDetailView()
                                .onAppear(perform: {
                                    model.beginLesson(index)
                                }),
                            label: {

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
                            })
                }
                }
            }
            .accentColor(.black)
            .padding()
            .navigationTitle(model.currentModule?.category ?? "")
        }
    }
}
