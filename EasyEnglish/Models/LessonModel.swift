//
//  Models.swift
//  EasyEnglish
//
//  Created by Kurbatov Artem on 23.06.2021.
//

import Foundation

struct Module: Decodable, Identifiable {
    
    var id: Int
    var category: String
    var content: Content
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
