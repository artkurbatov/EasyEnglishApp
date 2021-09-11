//
//  LaunchView.swift
//  EasyEnglish
//
//  Created by Kurbatov Artem on 25.07.2021.
//

import SwiftUI
import FirebaseAuth

struct LaunchView: View {
    
    @EnvironmentObject var model : ContentModel
    
    var body: some View {
        
        if model.loggedIn == false {
            LoginView()
                .onAppear(perform: {
                    model.checkLogin()
                })
        }
        else {
            TabView {
                HomeView()
                    .tabItem {
                        VStack {
                            Image(systemName: "book.fill")
                            Text("Обучение")
                        }
                    }
                ProfileView()
                    .tabItem {
                        VStack {
                            Image(systemName: "person.fill")
                            Text("Профиль")
                        }
                    }
            }
            .onAppear(perform: {
                model.getLocalData()
            })
        }
    }
}
