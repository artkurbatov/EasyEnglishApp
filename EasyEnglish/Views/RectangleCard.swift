//
//  RectangleButton.swift
//  EasyEnglish
//
//  Created by Kurbatov Artem on 04.07.2021.
//

import SwiftUI

struct RectangleCard: View {
    
    var color = Color.green
    
    var body: some View {
        Rectangle()
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

struct RectangleButton_Previews: PreviewProvider {
    static var previews: some View {
        RectangleCard()
    }
}
