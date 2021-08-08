//
//  TestResultView.swift
//  EasyEnglish
//
//  Created by Kurbatov Artem on 05.07.2021.
//

import SwiftUI

struct TestResultView: View {
    
    @EnvironmentObject var model: ContentModel
    var correct: Int
    
    var percent: Double {
        guard model.currentModule != nil else {
            return 0
        }
        return Double(correct)/Double(model.currentModule!.test.questions.count)
    }
    
    var num: String {
        return NSString(format:"%.0f", percent * 100) as String
    }
    
    var body: some View {
        
        VStack {
            ZStack {
                
                Rectangle()
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .shadow(radius: 10)
                
                VStack {
                    Text("Ваш результат:")
                        .font(.title2)
                        .bold()
                        
                        .padding(.top, 10)
                    
                    ZStack{
                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(width: 65, height: 65)
                            .foregroundColor(.yellow)
                            .shadow(radius: 2)
                        
                        Text("\(num)%")
                            .bold()
                    }
                    
                    Divider().background(Color.black)
                    
                    Spacer()
                    
                    HStack(spacing: 100) {
                        
                        VStack{
                            Text("Верно:")
                                .padding(.bottom, 5)
                            Text("\(correct)")
                                .foregroundColor(.green)
                        }
                        .font(.title3)
                        
                        VStack{
                            Text("Неверно:")
                                .padding(.bottom, 5)
                            Text("\((model.currentModule?.test.questions.count ?? 0) - correct)")
                                .foregroundColor(.red)
                        }
                        .font(.title3)
                    }
                    Spacer()
                }
            }
            .frame(width: 350, height: 200)
            
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
        .padding(.top, 50)
    }
}


struct TestResultView_Previews: PreviewProvider {
    static var previews: some View {
        TestResultView(correct: 10)
            .environmentObject(ContentModel())
    }
}

