//
//  ContentModel.swift
//  EasyEnglish
//
//  Created by Kurbatov Artem on 23.06.2021.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    @Published var currentModule: Module?
    
    var currentModuleIndex = 0
    
    init() {
        getLessonData()
    }
    
    func getLessonData() {
        
        let url = Bundle.main.url(forResource: "data", withExtension: "json")
        do{
            let data = try Data(contentsOf: url!)
            let decoder = JSONDecoder()
            let modules = try decoder.decode([Module].self, from: data)
            self.modules = modules
        }
        catch{
            print(error)
        }
        
    }
    
    func beginModule(_ moduleId: Int){
        for intdex in 0..<modules.count {
            if modules[intdex].id == moduleId{
                currentModuleIndex = intdex
                break
            }
        }
        currentModule = modules[currentModuleIndex]
    }
}
