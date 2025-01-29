//
//  AccountInfo.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 1/20/25.
//

import SwiftUI
import Foundation

struct AccountInfo: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
//        VStack{
//            Text("account view")
//            if let user =  modelData.authViewModel.currentUser {
//                Text("user is open")
//                Text(user.fullname)
//                
//                    .foregroundColor(.black)
//            }
//            Spacer()
//        }
//    }
//}
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
                Section("Account"){
                    Button {
                        modelData.authViewModel.signOut()
                    } label: {
                        SettingsRowView(imageName:"arrow.left.circle.fill",
                                        title:"Sign Out",
                                        tintColor: Color(.red))
                    }
                }
                        Button {
                            modelData.authViewModel.deleteAccount()
                        } label: {
                            SettingsRowView(imageName:"xmark.circle.fill",
                                            title:"Delete Account",
                                            tintColor:Color(.red))
                    }
                }
                .padding()
            }
        }
    }
}
struct AccountInfo_Previews: PreviewProvider {
    static var previews: some View{
        return AccountInfo()
            .environmentObject(ModelData())
    }
}

