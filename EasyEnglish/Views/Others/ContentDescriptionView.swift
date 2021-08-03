//
//  ContentDescriptionView.swift
//  EasyEnglish
//
//  Created by Kurbatov Artem on 04.07.2021.
//

import SwiftUI

struct ContentDescriptionView: UIViewRepresentable {
    
    @EnvironmentObject var model: ContentModel
    
    func makeUIView(context: Context) -> UITextView {
        
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 17.0)
        textView.isEditable = false
        
        return textView
    }
    
    func updateUIView(_ textView: UITextView, context: Context) {
        
        textView.text = model.currentLesson?.explanation
        textView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
    }
}

struct ContentDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDescriptionView()
    }
}
