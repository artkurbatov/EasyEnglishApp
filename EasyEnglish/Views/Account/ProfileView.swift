//
//  ProfileView.swift
//  EasyEnglish
//
//  Created by Kurbatov Artem on 10.09.2021.
//

import SwiftUI
import Firebase

struct ProfileView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        VStack {
            HStack {
                VStack {
                    Text("Здравствуй,")
                        .bold()
                        .font(.title2)
                    Text("\(SingleUser.shared.user.name)!")
                        .bold()
                        .font(.title2)
                }
                
                Spacer()
                
                Button(action: {
                    try! Auth.auth().signOut()
                    model.checkLogin()
                }, label: {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: 80, height: 40)
                            .cornerRadius(30)
                            .shadow(radius: 1)
                        
                        Text("Выйти")
                            .bold()
                            .foregroundColor(.black)
                    }
                })
            }
            .padding([.horizontal, .top])
            .padding(.bottom, 2)
            
            Divider()
            
            Text("История тестов:")
                .font(.title3)
                .padding(.vertical)
            
            ScrollView {
                
                if model.results.count == 0 {
                    Text("История пуста")
                        .foregroundColor(.gray)
                        .opacity(0.7)
                }
                else {
                    VStack{
                        ForEach(model.results, id: \.self){ result in
                            VStack{
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                        .shadow(radius: 1)
                                        .aspectRatio(CGSize(width: 335, height: 70), contentMode: .fit)
                                    
                                    HStack{
                                        Text("Тест \(result.title)")
                                        Spacer()
                                        ZStack{
                                            ProgressBarView(progress: result.percent, lineWidth: 7)
                                                .frame(width: 50, height: 50, alignment: .center)
                                            
                                            Text(String(format: "%.0f %%", result.percent * 100))
                                                .foregroundColor(.black)
                                                .bold()
                                                .font(.caption)
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }
}
