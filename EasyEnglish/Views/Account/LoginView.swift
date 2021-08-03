//
//  LoginView.swift
//  EasyEnglish
//
//  Created by Kurbatov Artem on 25.07.2021.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct LoginView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var login = LoginMode.login
    @State var email = ""
    @State var password = ""
    @State var name = ""
    @State var errorMessage: String? = nil
    
    var buttonText: String {
        if login == LoginMode.login {
            return "Войти"
        }
        else {
           return "Зарегистрироваться"
        }
    }
  
    
    enum LoginMode {
        case login
        case createAccount
    }
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            Spacer()
            
            Image(systemName: "graduationcap")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 150)
            
            Text("Easy English")
                .bold()
                .font(.largeTitle)
            
            Spacer()
            
            Picker(selection: $login, label: Text("Picker"), content: {
                Text("Вход").tag(LoginMode.login)
                Text("Регистрация").tag(LoginMode.createAccount)
            })
            .pickerStyle(SegmentedPickerStyle())
            .padding(.bottom, 10)
            
            Group {
            
                if login == LoginMode.createAccount {
                    
                    TextField("Имя", text: $name)
                }
                
            TextField("Почта", text: $email)
                
            SecureField("Пароль", text: $password)
                
                if errorMessage != nil {
                    Text(errorMessage!)
                }
                
            }
            
            Button(action: {
                if login == LoginMode.login {
                   
                    Auth.auth().signIn(withEmail: email, password: password) { result, error in
                        
                        guard error == nil else {
                            errorMessage = error!.localizedDescription
                            return
                        }
                        
                        self.errorMessage = nil
                        self.model.checkLogin()
                    }
                }
                else {
                    
                    Auth.auth().createUser(withEmail: email, password: password) { result, error in
                        
                        guard error == nil else {
                            self.errorMessage = error!.localizedDescription
                            return
                        }
                        
                        self.errorMessage = nil
                        
                        let firebaseUser = Auth.auth().currentUser
                        let db = Firestore.firestore()
                        let ref = db.collection("users").document(firebaseUser!.uid)
                        
                        ref.setData(["name": name], merge: true)
                        
                        let user = UserService.shared.user
                        user.name = name
                        
                        self.model.checkLogin()
                    }
                }
            }, label: {
                ZStack {
                    Rectangle()
                        .foregroundColor(.blue)
                        .frame(height: 40)
                        .cornerRadius(10)
                    
                    Text(buttonText)
                        .foregroundColor(.white)
                }
            })
            .padding(.top, 10)
            
            Spacer()
        }
        .padding(.horizontal, 40)
        .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
