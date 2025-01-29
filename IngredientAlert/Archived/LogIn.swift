////
////  LogIn.swift
////  IngredientAlert
////
////  Created by Madeline  Bennett on 1/16/25.
////
//
//import SwiftUI
//
//struct LogInPage: View {
//    @environmentObject var modelData: ModelData
//    
//    var body: some View{
//        
//        LoginFormView()
//            .enviromentObject(ModelData())
//    }
//}
//import SwiftUI
//
//struct LogIn: View {
//    @EnvironmentObject var modelData: ModelData
//    @State private var email: String = ""
//    @State private var password: String = ""
//    
//    var body: some View {
//        NavigationStack{
//            VStack{
//                
//                Image("logo")
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width:120, height: 120)
//                    .padding(.vertical, 32)
//                //image
//                
//                //form fields
//                VStack(spacing: 24){
//                    InputView(text: $email,
//                              title: "Email Address",
//                              placeholder: "name@example.com")
//                    .autocorrectionDisabled(true)
//                    
//                    InputView(text:$password,
//                              title:"Password",
//                              placeholder: "Enter your password",
//                              isSecureField: true)
//                    .autocorrectionDisabled(true)
//                    
//                }
//                .padding(.horizontal)
//                .padding(.top, 12)
//                
//                
//                // signin button
//                Button{
//                    Task{
//                        try await modelData.authViewModel.signIn(withEmail: email, password: password)
//                    }
//                } label: {
//                    HStack {
//                        Text("SIGN IN")
//                            .fontWeight(.semibold)
//                        Image(systemName: "arrow.right")
//                    }
//                    .foregroundColor(.white)
//                    .frame(width:350, height: 48)
//                }
//                .background(Color(.systemBlue))
//                .disabled(!formIsValid)
//                .opacity(formIsValid ? 1.0 : 0.5)
//                .cornerRadius(10)
//                .padding(.top, 24)
//                
//                Spacer()
//                
//                NavigationLink {
//                    RegistrationView()
//                        .navigationBarBackButtonHidden(true)
//                } label: {
//                    HStack{
//                        Text("Dont have an account?")
//                        Text("Sign Up!")
//                            .fontWeight(.bold)
//                    }
//                    .font(.system(size: 14))
//                }
//            }
//            
//            
//            
//        }
//        
//        //sign up button
//
//    }
//    
//}
//
//// MARK: AuthenticationFormProtocol
//extension LogIn: AuthenticationFormProtocol {
//    var formIsValid: Bool {
//        return !email.isEmpty
//        && email.contains("@")
//        && !password.isEmpty
//        && password.count >= 8
//    }
//}
//
//
//struct LogIn_Previews: PreviewProvider {
//    static var previews: some View {
//        LogIn()
//    }
//}
//
//#Preview {
//    LogIn()
//}
