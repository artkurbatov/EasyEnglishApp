//
//  Models.swift
//  EasyEnglish
//
//  Created by Kurbatov Artem on 24.06.2021.
//

import Foundation

struct Module: Decodable, Identifiable {
    
    var id: Int
    var category: String
    var content: Content
    var test: Test
}

struct Content: Decodable, Identifiable {
    
    var id: Int
    var image: String
    var description: String
    var lessons: [Lesson]
}

struct Lesson: Decodable, Identifiable {
    
    var id: Int
    var title: String
    var explanation: String
}

struct Test: Decodable, Identifiable {
    
    var id: Int
    var questions: [Question]
}

struct Question: Decodable, Identifiable {
    
    var id: Int
    var content: String
    var correctIndex: Int
    var answers: [String]
}

class User {
    var name = ""
    var results: [Result]?
}

struct Result: Hashable {
    var title: String
    var percent: Float
}
