//
//  ContentModel.swift
//  EasyEnglish
//
//  Created by Kurbatov Artem on 23.06.2021.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    @Published var tests = [Test]()
    
    init() {
        getLessonData()
        getTestData()
    }
    
    func getLessonData() {
        
        let url = Bundle.main.url(forResource: "lessonData", withExtension: "json")
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
    
    func getTestData() {
        
        let url = Bundle.main.url(forResource: "testData", withExtension: "json")
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
    
    
}
