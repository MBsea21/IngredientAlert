//
//  LogInForm.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 1/20/25.
//

//import SwiftUI
//
//
//
//struct LogInForm: View {
//    @State private var inputUsername: String = ""
//    @State private var inputPassword: String = ""
//    @State private var logInSuccesful: Bool = false
//    
//    @FocusState private var usernameFieldIsFocused: Bool
//    
//    
//    func checkUsername () -> Bool{
//        if inputUsername == "test" {
//            return true
//        }
//        else {
//            return false
//        }
//    }
//
//    func checkPassword () -> Bool{
//        if inputPassword == "test" {
//            return true
//        }
//        else {
//            return false
//        }
//    }
//
//    
//    
//    
//    func handleLoginAttempt(){
//        let passwordTrue = checkPassword()
//        let usernameTrue = checkUsername()
//        
//        if passwordTrue == true && usernameTrue == true {
//            logInSuccesful = true
//        }
//        else {
//            logInSuccesful = false
//        }
//    }
//    
//    
//    
//    var body: some View {
//        TopNavMenu()
//            .environment(ModelData())
//        Form {
//            HStack{
//                Text("Username")
//                TextField(text: $inputUsername, prompt: Text("Required")) {
//                    Text("Username")
//                }.autocapitalization(false)
//            }
//            HStack{
//                Text("Password ")
//                SecureField(text: $inputPassword, prompt: Text("Required")) {
//                    Text("Password")
//                }
//            }
//            Button(action: handleLoginAttempt) {
//                Label("Sign In", systemImage: "arrow.up")
//                
//            }.buttonStyle(BorderedButtonStyle())
//        }.textFieldStyle(.roundedBorder)
//        if logInSuccesful == true {
//            Text ("log in was succesfull!!")
//        }
//        }
//}
//
//#Preview {
//    LogInForm()
//        .environment(ModelData())
//}
