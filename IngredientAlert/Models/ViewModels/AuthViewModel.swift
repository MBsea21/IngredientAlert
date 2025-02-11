//
//  AuthViewModel.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 1/28/25.
//
import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var currentUserFlaggedDict: [String: Ingredient] = [:]
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        Task {
            await fetchUser()
        }
    }
    
    
    
    
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("DEBUG: Failed to log in with error \(error.localizedDescription)")
        }
    }
    
    
    
    
    func createUser(withEmail email: String, password: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullname: fullname, email: email, isAdmin: false, flaggedListId: [])
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch {
            print("Debug: failed to create user with error \(error.localizedDescription)")
        }
    }
    
    
    func signOut() {
        do {
            try Auth.auth().signOut() // signs user out on backend
            self.userSession = nil //wipes out user session and takes us back to login screen
            self.currentUser = nil // wipes out current user data model
            print("signed out current user")
        } catch {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
            
        }
    }
    
    
    func deleteAccount() {
        do {
            let user = Auth.auth().currentUser
            
            user?.delete { error in
                if let error = error {
                    print("ann error happened\(error)")
                    // An error happened.
                } else {
                    
                    print("account deleted")
                    self.userSession = nil
                    self.currentUser = nil
                    // Account deleted.
                }
                
            }
        }
        
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: User.self)
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: NSNotification.Name("ingredientAlert.userDataLoaded"), object: nil)
        }
    }

    func addAllNamesFlagged(_ ingredient: Ingredient, ingredientList: [Ingredient]) async{
        await self.fetchUser()
        let currentUser = self.currentUser!
        var flaggedList = self.currentUser!.flaggedListId
        
        for ingredientData in ingredientList {
            if ingredientData.commonName == ingredient.commonName {
                let ingredientDataId = ingredientData.id!
                if !flaggedList.contains(ingredientDataId) {
                    flaggedList.append(ingredientDataId)
                }
                let user = User(id: currentUser.id, fullname: currentUser.fullname, email: currentUser.email, isAdmin: currentUser.isAdmin, flaggedListId: flaggedList)
                do {
                    try Firestore.firestore().collection("users").document(user.id).setData(from: user)
                } catch {
                    fatalError("DEBUG: unable to update user flagged list: \(error.localizedDescription)")
                }
                
            }
        }
    }
    func addSingleFlagged(_ ingredient: Ingredient, ingredientList: [Ingredient]) async{
        await self.fetchUser()
        let currentUser = self.currentUser!
        var flaggedList = self.currentUser!.flaggedListId
        
        for ingredientData in ingredientList {
            if ingredientData.inputName == ingredient.inputName {
                let ingredientDataId = ingredientData.id!
                if !flaggedList.contains(ingredientDataId) {
                    flaggedList.append(ingredientDataId)
                }
                let user = User(id: currentUser.id, fullname: currentUser.fullname, email: currentUser.email, isAdmin: currentUser.isAdmin, flaggedListId: flaggedList)
                do {
                    try Firestore.firestore().collection("users").document(user.id).setData(from: user)
                } catch {
                    fatalError("DEBUG: unable to update user flagged list: \(error.localizedDescription)")
                }
                
            }
        }
    }
    func removeCommonFromFlagged (_ removedIngredient: Ingredient) async {
        await self.fetchUser()
        let currentUser = self.currentUser!
        var newFlaggedList: [String] = []
        
        for (ingredientName, ingredientData) in self.currentUserFlaggedDict {
            if ingredientName != removedIngredient.inputName {
                self.currentUserFlaggedDict.removeValue(forKey: ingredientName)
                if ingredientData.commonName != removedIngredient.commonName {
                    self.currentUserFlaggedDict.removeValue(forKey: ingredientData.inputName)
                    let ingredientId = ingredientData.id
                    newFlaggedList.append(ingredientData.id!)
                }
            }
        }
        let user = User(id: currentUser.id, fullname: currentUser.fullname, email: currentUser.email, isAdmin: currentUser.isAdmin, flaggedListId: newFlaggedList)
        do {
            try Firestore.firestore().collection("users").document(user.id).setData(from: user)
        } catch {
            fatalError("DEBUG: unable to remove instances from user flagged list: \(error.localizedDescription)")
        }
        
    }
    
    func removeSingleInstanceFromFlagged (_ removedIngredient: Ingredient) async {
        await self.fetchUser()
        let currentUser = self.currentUser!
        let removedIngredientId = removedIngredient.id!
        self.currentUserFlaggedDict.removeValue(forKey: removedIngredient.inputName)
        let newFlaggedList: [String] = (self.currentUser?.flaggedListId.filter{ $0 != removedIngredientId })!
        let user = User(id: currentUser.id, fullname: currentUser.fullname, email: currentUser.email, isAdmin: currentUser.isAdmin, flaggedListId: newFlaggedList)
        do {
            try Firestore.firestore().collection("users").document(user.id).setData(from: user)
        } catch {
            fatalError("DEBUG: unable to remove instance from user flagged list: \(error.localizedDescription)")
        }
        
    }
    func getCurrentFlaggedDict(flaggedListId: [String], ingredientsList: [Ingredient]) -> [String: Ingredient] {
        var flaggedDict:[String: Ingredient] = [:]
        for ingredient in ingredientsList {
            if flaggedListId.contains(ingredient.id!) {
                   flaggedDict[ingredient.inputName] = ingredient
                }
            }
        return flaggedDict
        }
    }


