//
//  StorageManager.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 2/4/25.
//

import SwiftUI
import FirebaseStorage

struct StorageContext {
    
    static func save(data: Data, folderPath: String, completion: @escaping (Result<URL, Error>) -> Void) {
        let fileName = UUID().uuidString
        let reference = Storage.storage().reference()
            .child(folderPath)
            .child(fileName)
        reference.putData(data) { _, error in
            if let error {
                completion(.failure(error))
                return
            }
            reference.downloadURL(completion: completion)
        }
    }
    
    static func save(image: UIImage, folderPath: String, compressionQuality: CGFloat = 1.0, completion: @escaping (Result<URL, Error>) -> Void) {
        guard let data = image.jpegData(compressionQuality: compressionQuality) else { return }
        save(data: data, folderPath: folderPath, completion: completion)
    }
    
    static func delete(at url: String, completion: ((Error?) -> Void)? = nil) {
        let reference = Storage.storage().reference(forURL: url)
        reference.delete(completion: completion)
    }
        static func handleImageChange(newImage: UIImage, folderPath: String, compressionQuality: CGFloat = 1.0, oldImageUrl: String, completion: @escaping(Result<URL, Error>) -> Void) {
            guard oldImageUrl.contains("https") else {
                save(image:newImage, folderPath: folderPath, compressionQuality: compressionQuality, completion: completion)
                return
            }
            delete (at: oldImageUrl) {error in
                if let error {
                    completion(.failure(error))
                    return
                }
                save(image: newImage, folderPath: folderPath, compressionQuality: compressionQuality, completion: completion)
            }
        }
    static func handleImageChange(newImage: UIImage, folderPath: String, compressionQuality: CGFloat = 1.0, oldImageUrl: String) async throws  -> URL {
        try await withCheckedThrowingContinuation { continuation in
            handleImageChange(newImage: newImage, folderPath: folderPath, compressionQuality: compressionQuality, oldImageUrl: oldImageUrl)
            { result in
                continuation.resume(with: result)
                
            }
        }
        
    }
}



        
    
    /// upload image
  
