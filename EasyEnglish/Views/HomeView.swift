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
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
