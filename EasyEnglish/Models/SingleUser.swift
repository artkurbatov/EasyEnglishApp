//
//  SingleUser.swift
//  EasyEnglish
//
//  Created by Kurbatov Artem on 10.09.2021.
//

import Foundation

class SingleUser {
    
    var user = User()
    
    static var shared = SingleUser()
    
    private init() {
    }
}
