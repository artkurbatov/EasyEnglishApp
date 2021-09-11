//
//  ContentView.swift
//  EasyEnglish
//
//  Created by Kurbatov Artem on 23.06.2021.
//

import SwiftUI
import FirebaseAuth

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        NavigationView {
            VStack (alignment: .leading) {
                ScrollView {
                    LazyVStack {
                        ForEach(model.modules) { module in
                            
                            VStack(spacing: 5) {
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
                                
                                NavigationLink(
                                    destination: TestView()
                                        .onAppear(perform: {
                                            model.beginTest(module.id)
                                        }),
                                    tag: module.id,
                                    selection: $model.currentTestSelected,
                                    label: {
                                        SingleTestView( title: "Тест по теме \(module.category)")
                                    })
                            }
                        }
                    }
                    .accentColor(.black)
                    .padding()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Easy English")
            .onChange(of: model.currentContentSelected) { value in
                if value == nil {
                    model.currentModule = nil
                }
            }
            .onChange(of: model.currentTestSelected) { value in
                if value == nil {
                    model.currentModule = nil
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(ContentModel())
    }
}
