//
//  TestView.swift
//  EasyEnglish
//
//  Created by Kurbatov Artem on 04.07.2021.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model: ContentModel
    
    @State var selectedAnswerIndex: Int?
    @State var result = 0
    @State var wrong = 0
    @State var submitted = false
    @State var showResults = false
    
    var progress: Float {
        guard model.currentModule != nil else {
            return 0
        }
        return Float(model.currentQuestionIndex)/Float(model.currentModule?.test.questions.count ?? 1)
    }
    
    var body: some View {
        
        if model.currentQuestion != nil && showResults == false {
            
            VStack(alignment: .leading){
                
                Text("Вопрос \(model.currentQuestionIndex + 1) из \(model.currentModule?.test.questions.count ?? 0)\n")
                    .padding(.leading, 20)
                    .padding(.top, 10)
                
                Text(model.currentQuestion!.content)
                    .padding(.horizontal, 20)
                
                Spacer()
                
                VStack{
                    ForEach(0..<model.currentQuestion!.answers.count, id: \.self) { index in
                        
                        Button(action: {
                            selectedAnswerIndex = index
                        }, label: {
                            ZStack{
                                if submitted == false{
                                    Rectangle()
                                        .foregroundColor(index == selectedAnswerIndex ? .gray : .white)
                                        .cornerRadius(10)
                                        .shadow(radius: 1)
                                        .frame(height: 48)
                                }
                                else{
                                    if index == selectedAnswerIndex && index == model.currentQuestion!.correctIndex{
                                        Rectangle()
                                            .foregroundColor(.green)
                                            .cornerRadius(10)
                                            .shadow(radius: 1)
                                            .frame(height: 48)
                                    }
                                    else if index == selectedAnswerIndex && index != model.currentQuestion!.correctIndex{
                                        Rectangle()
                                            .foregroundColor(.red)
                                            .cornerRadius(10)
                                            .shadow(radius: 1)
                                            .frame(height: 48)
                                    }
                                    else if index == model.currentQuestion!.correctIndex{
                                        Rectangle()
                                            .foregroundColor(.green)
                                            .cornerRadius(10)
                                            .shadow(radius: 1)
                                            .frame(height: 48)
                                    }
                                    else{
                                        Rectangle()
                                            .foregroundColor(.white)
                                            .cornerRadius(10)
                                            .shadow(radius: 1)
                                            .frame(height: 48)
                                    }
                                }
                                Text(model.currentQuestion!.answers[index])
                            }
                        })
                        .disabled(submitted)
                    }
                }
                .accentColor(.black)
                .padding()
                
                Spacer()
                
                Button(action: {
                    if submitted == true {
                        if model.currentQuestionIndex + 1 == model.currentModule?.test.questions.count  {
                            
                            model.nextQuestion()
                            showResults = true
                        }
                        else {
                            model.nextQuestion()
                            submitted = false
                            selectedAnswerIndex = nil
                        }
                    }
                    else {
                        submitted = true
                        if selectedAnswerIndex == model.currentQuestion!.correctIndex{
                            
                            result += 1
                        }
                    }
                }, label: {
                    ZStack{
                        Rectangle()
                            .foregroundColor(.green)
                            .cornerRadius(10)
                            .shadow(radius: 1)
                            .frame(height: 48)
                        
                        Text(buttonText)
                            .bold()
                            .foregroundColor(.white)
                        
                    }
                    .padding()
                })
                .disabled(selectedAnswerIndex == nil)
            }
            .navigationBarTitle("Тест \(model.currentModule?.category ?? "")")
        }
        else if showResults == true {
            TestResultView(correct: result)
        }
        else {
            ProgressView()
        }
    }
    
    var buttonText: String {
        
        if submitted == true {
            if model.currentQuestionIndex + 1 == model.currentModule?.test.questions.count  {
                return "Завершить"
            }
            else {
                return "Следующий вопрос"
            }
        }
        else{
            return "Ответить"
        }
    }
}


struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView().environmentObject(ContentModel())
    }
}
