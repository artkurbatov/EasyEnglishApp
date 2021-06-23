//
//  EasyEnglishApp.swift
//  EasyEnglish
//
//  Created by Kurbatov Artem on 23.06.2021.
//

import SwiftUI

@main
struct EasyEnglishApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(ContentModel())
        }
    }
}
