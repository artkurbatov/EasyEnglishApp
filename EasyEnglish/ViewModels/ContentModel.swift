//
//  ContentModel.swift
//  EasyEnglish
//
//  Created by Kurbatov Artem on 23.06.2021.
//

import Foundation
import Firebase
import FirebaseAuth

class ContentModel: ObservableObject {
    
    @Published var loggedIn = false
    
    @Published var modules = [Module]()
    @Published var results = [Result]()
    
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    @Published var currentLesson: Lesson?
    var currentLessonIndex = 0
    
    @Published var currentQuestion: Question?
    var currentQuestionIndex = 0
    
    @Published var currentContentSelected: Int?
    @Published var currentTestSelected: Int?
    
    init() {
    }
    
    func checkLogin() {
        
        loggedIn = Auth.auth().currentUser != nil ? true : false
        
        if SingleUser.shared.user.name == "" {
            getUserData()
        }
    }
    
    func getLocalData() {
        
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
    
    func getUserData() {
        
        guard Auth.auth().currentUser != nil else {
            return
        }
        
        let db = Firestore.firestore()
        let path = db.collection("users").document(Auth.auth().currentUser!.uid)
        path.getDocument { snapshot, error in
            
            guard error == nil, snapshot != nil else {
                return
            }
            
            let data = snapshot!.data()
            let user = SingleUser.shared.user
            user.name = data?["name"] as? String ?? ""
        }
        
        db.collection("users").document(Auth.auth().currentUser!.uid).collection("results").getDocuments() { querySnapshot, error in
            
            guard error == nil, querySnapshot != nil else {
                return
            }
            
            for document in querySnapshot!.documents {
                let title = document.data()["title"] as? String
                let percent = document.data()["percent"] as? Float
                self.results.append(Result(title: title ?? "", percent: percent ?? 0.0))
            }
        }
    }
    
    func saveData(title: String, percent: Float) {
        
        if let loggedInUser = Auth.auth().currentUser {
            
            let db = Firestore.firestore()
            let path = db.collection("users").document(loggedInUser.uid).collection("results").document("test\(self.results.count + 1)")
            path.setData(["title": title, "percent" : percent], merge: true)
            self.results.append(Result(title: title, percent: percent))
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
        
        currentQuestionIndex = 0
        
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
        
        guard currentModule != nil else {
            return false
        }
        return currentLessonIndex + 1 < currentModule!.content.lessons.count
    }
    
    func beginTest(_ moduleId: Int) {
        
        beginModule(moduleId)
        currentQuestionIndex = 0
        currentLessonIndex = 0
        
        if currentModule?.test.questions.count ?? 0 > 0 {
            currentQuestion = currentModule!.test.questions[currentQuestionIndex]
        }
    }
    
    func nextQuestion() {
        
        currentQuestionIndex += 1
        
        if currentQuestionIndex < currentModule!.test.questions.count {
            currentQuestion = currentModule!.test.questions[currentQuestionIndex]
        }
        else {
            currentQuestion = nil
            currentQuestionIndex = 0
        }
    }
    
    func getPercent(correct: Int, totalCount: Int?) -> Float {
        
        guard totalCount != nil else {
            return 0.0
        }
        
        return Float(correct/totalCount!)
    }
}
