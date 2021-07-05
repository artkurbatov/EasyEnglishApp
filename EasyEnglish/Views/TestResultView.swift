//
//  TestResultView.swift
//  EasyEnglish
//
//  Created by Kurbatov Artem on 05.07.2021.
//

import SwiftUI

struct TestResultView: View {
    
    @EnvironmentObject var model: ContentModel
    var result: Int
    
    var body: some View {
        
        VStack {
            Text(resultText)
                .font(.title)
                .padding(.bottom, 30)
            
            Text("Вы ответили на \(result) из \(model.currentModule?.test.questions.count ?? 0) вопросов верно")
            Spacer()
            
            Button {
                model.currentTestSelected = nil
            } label: {
                ZStack {
                    Rectangle()
                        .foregroundColor(.green)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .frame(height: 48)
                    
                    Text("Завершить тест")
                        .bold()
                        .foregroundColor(.white)
                }
            }
            .padding()
        }
        .padding(.top, 100)
    }
    
    var resultText: String {
        guard model.currentModule != nil else {
            return ""
        }
        
        let percent = Double(result)/Double(model.currentModule!.test.questions.count)
        
        if percent == 1 {
            return "Великолепно!"
        }
        else if percent >= 0.85 {
            return "Отличный результат!"
        }
        else if percent >= 0.6 {
            return "Хороший результат!"
        }
        else if percent >= 0.35 {
            return "Вы можете лучше."
        }
        else{
            return "Попробуйте ещё раз."
        }
    }
}
