//
//  AccountInfo.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 1/20/25.
//

import SwiftUI
import Foundation

struct AccountInfo: View {
    //    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var modelData: ModelData
    @Binding var isLoggedIn: Bool
    @State private var viewFlaggedList: Bool = false
//    @State private var showAllNames: Bool = false
//    @State private var showRemoveFlaggedIngredientAlert: Bool = false
    
    private func getFlaggedListInfo(dict: [String: Ingredient]) -> [Ingredient] {
        var ingArr: [Ingredient] = []
        for (ingredientName, ingredientData) in dict {
            ingArr.append(ingredientData)
        }
        return ingArr
}
    
    var body: some View {
        if let user = modelData.authViewModel.currentUser {
            ScrollView{
                VStack(alignment:.leading, spacing: 24){
                    Section{
                        HStack{
                            Text(user.initials)
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(width: 72, height: 72)
                                .background(Color(.bGrayGreen))
                                .clipShape(Circle())
                            VStack(alignment: .leading, spacing: 4) {
                                Text(user.fullname)
                                    .fontWeight(.semibold)
                                    .padding(.top, 4)
                                Text(user.email)
                                    .font(.footnote)
                                    .foregroundColor(.bGrayGreen)
                            }
                        }
                    }
                    Section("general") {
                        HStack{
                            SettingsRowView(imageName: "gear",
                                            title: "version",
                                            tintColor: Color(.bGrayGreen))
                            Spacer()
                            Text("1.0.0")
                                .font(.subheadline)
                                .foregroundColor(.bGrayGreen)
                        }
                    }
                    Section("Account") {
                        Toggle("Personal Flagged List", isOn: $viewFlaggedList)
                        
                        if viewFlaggedList == true {
                            let flaggedList = getFlaggedListInfo(dict: modelData.authViewModel.currentUserFlaggedDict)
                            PersonalFlaggedListWindow(flaggedList: flaggedList)
                                .environmentObject(modelData)
                            }
    
                        
                            HStack {
                                Button {
                                    Task{
                                        modelData.authViewModel.signOut()
                                        if modelData.authViewModel.userSession == nil {
                                            isLoggedIn = false
                                        }
                                    }
                                } label: {
                                    SettingsRowView(imageName:"arrow.left.circle.fill",
                                                title:"Sign Out",
                                                tintColor: Color(.red))
                                    .foregroundColor (.white)
                                }
                                Spacer()
                            
                                Button {
                                    Task {
                                        modelData.authViewModel.deleteAccount()
                                    
                                        if modelData.authViewModel.userSession == nil {
                                            isLoggedIn = false
                                        }
                                    }
                                
                                } label: {
                                    SettingsRowView(imageName:"xmark.circle.fill",
                                                    title:"Delete Account",
                                                    tintColor:Color(.red))
                            }
                        }
                    }
                }.padding()
                
            }
            
        } else {
            LoginFormView(isLoggedIn: Binding.constant(false))
        }
        
        
        
    }
    
}





struct AccountInfo_Previews: PreviewProvider {
    static var previews: some View{
        return AccountInfo(isLoggedIn: Binding.constant(true))
            .environmentObject(ModelData())
    }
}

