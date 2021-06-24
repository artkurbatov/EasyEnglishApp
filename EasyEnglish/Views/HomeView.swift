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
        
        
        NavigationView{
            TabView{
                    ScrollView{
                    LazyVStack(alignment: .leading)  {
                        Text("Теория")
                            .bold()
                            .font(.largeTitle)
                            .padding(.leading)
                           
                        ForEach(model.modules) { module in

                            NavigationLink(
                                destination: ContentView()
                                    .onAppear(perform: {
                                        model.beginModule(module.id)
                                    }),
                                label: {
                                    SingleModuleView(image: module.content.image, title: module.category, discription: module.content.description)
                                })
                                .foregroundColor(.black)
                        }
                }
                }
                .tabItem {
                    VStack{
                        Image(systemName: "book")
                        Text("Теория")
                    }.navigationBarTitle("", displayMode: .inline)
            }
                    ScrollView{
                    VStack(alignment: .leading)  {
                        Text("Тест")
                            .bold()
                            .font(.largeTitle)
                            .padding(.leading)
                        
                        ForEach(model.modules) { module in
                            
                            NavigationLink(
                                destination: ContentView()
                                    .onAppear(perform: {
                                        model.beginModule(module.id)
                                    }),
                                label: {
                                    SingleModuleView(image: module.content.image, title:"Тест по теме \(module.category)", discription: "")
                                })
                                .foregroundColor(.black)
                        }                }
                }
                .tabItem {
                    VStack{
                        Image(systemName: "list.bullet")
                        Text("Тесты")
                    }
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
