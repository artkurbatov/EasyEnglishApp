//
//  ContentView.swift
//  EasyEnglish
//
//  Created by Kurbatov Artem on 23.06.2021.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
        
    var body: some View {
        
        NavigationView {
            VStack (alignment: .leading) {
                ScrollView {
                    
                    LazyVStack {
                        
                        ForEach(model.modules) { module in
                            
                            VStack {
                                
                                NavigationLink(
                                    destination:
                                        ContentView()
                                            .onAppear(perform: {
                                                model.beginModule(module.id)
                                            }),
                                    tag: module.id,
                                    selection: $model.currentContentSelected,
                                    label: {
                                        
                                        SingleModuleView(image: module.content.image, title: module.category, description: module.content.description)
                                        
                                    })
                                
                               SingleTestView( title: "Тест по теме \(module.category)")
                                
                            }
                        }
                        
                    }
                    .accentColor(.black)
                    .padding()
                    
                }
            }
            .navigationTitle("C чего начнём?")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(ContentModel())
    }
}
