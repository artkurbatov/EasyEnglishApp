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
    
    @Published var currentLesson: Lesson?
    var currentLessonIndex = 0
    
    @Published var currentTest: Lesson?
    var currentTestIndex = 0
    
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
        for index in 0..<modules.count {
            if modules[index].id == moduleId{
                currentModuleIndex = index
                break
            }
        }
        currentModule = modules[currentModuleIndex]
    }
    
    func beginLesson(_ lessonIndex: Int){
        
        if lessonIndex < currentModule!.content.lessons.count{
            currentLessonIndex = lessonIndex
        }
        else{
            currentLessonIndex = 0
        }
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
    }
    
    func nextLesson() {
        
        currentLessonIndex += 1
        
        if currentLessonIndex < currentModule!.content.lessons.count{
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
        }
        else{
            currentLesson = nil
            currentLessonIndex = 0
        }
    }
    
    func hasNextLesson() -> Bool{
        
        return currentLessonIndex + 1 < currentModule!.content.lessons.count
    }
}
