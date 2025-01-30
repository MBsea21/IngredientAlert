////
////  RegistrationView.swift
////  IngredientAlert
////
////  Created by Madeline Bennett on 1/28/25.
////
//
import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var modelData: ModelData
    
    
    var body: some View {
        NavigationStack{
            VStack{
                
                Image("iconLogoSquare")
                    .resizable()
                    .scaledToFill()
                    .frame(width:120, height: 120)
                    .padding(.vertical, 32)
                //image
                
                //form fields
                VStack(spacing: 24){
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "name@example.com")
                    .autocorrectionDisabled(true)
                    
                    InputView(text: $fullname,
                              title: "Full Name",
                              placeholder: "Jane Doe")
                    .autocorrectionDisabled(true)
                    
                    InputView(text:$password,
                              title:"Password",
                              placeholder: "Enter your password",
                              isSecureField: true)
                    .autocorrectionDisabled(true)
                    
                    ZStack(alignment: .trailing){
                        InputView(text:$confirmPassword,
                                  title:"Confirm Password",
                                  placeholder: "Enter your password again",
                                  isSecureField: true)
                        .autocorrectionDisabled(true)
                        
                        if !password.isEmpty && !confirmPassword.isEmpty {
                            if password == confirmPassword {
                                Image(systemName: "checkmark.circle.fill")
                                    .imageScale(.large)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(.systemGreen))
                            } else {
                                Image(systemName: "xmark.circle.fill")
                                    .imageScale(.large)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(.systemRed))
                            }
                            
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                
                // signin button
                Button{
                    Task {
                        try await modelData.authViewModel.createUser(withEmail: email,
                                                       password: password,
                                                       fullname: fullname)
                    }
                } label: {
                    HStack {
                        Text("SIGN UP")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width:350, height: 48)
                }
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                .background(Color(.systemBlue))
                .cornerRadius(10)
                .padding(.top, 24)
                
                Spacer()
                
                
                Button{
                    dismiss()
                } label: {
                    HStack{
                        Text("Already have an account?")
                        Text("Sign in!")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                }
            }
            
            
        }
        //sign up button
    }
    
}

// MARK: AuthenticationFormProtocol
extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count >= 8
        && !fullname.isEmpty
        && password == confirmPassword
        
    }
}


struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

