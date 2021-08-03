//
//  UserService.swift
//  EasyEnglish
//
//  Created by Kurbatov Artem on 26.07.2021.
//

import Foundation

class UserService {
    
    var user = User()
    
    static var shared = UserService()
    
    private init() {
        
    }
}
