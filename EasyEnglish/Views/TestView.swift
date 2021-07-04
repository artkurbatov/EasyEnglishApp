//
//  TestView.swift
//  EasyEnglish
//
//  Created by Kurbatov Artem on 04.07.2021.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        if model.currentQuestion != nil {
            
            VStack{
                Text("Вопрос \(model.currentQuestionIndex + 1) из \(model.currentModule?.test.questions.count ?? 0)\n")
                
                Text(model.currentQuestion!.content)
                
                Spacer()
                
                //ContentDescriptionView()
                
            }
            .navigationBarTitle("Тест \(model.currentModule?.category ?? "")")
        }
        else {
            ProgressView()
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView().environmentObject(ContentModel())
    }
}
