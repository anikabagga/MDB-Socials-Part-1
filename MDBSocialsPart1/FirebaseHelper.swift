//
//  FirebaseHelper.swift
//  MDBSocialsPart1
//
//  Created by Anika Bagga on 9/28/18.
//  Copyright © 2018 Anika Bagga. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage
import UIKit

class FirebaseHelper{
    let rootRef = FIRDatabase.database().reference()
    
    static func getCurrentUser() -> User? {
        return Auth.auth().currentUser
    }
    
    static func createNewUser(name: String, email: String, completionBlock: @escaping () -> ()){
        let usersRef = rootRef.child("User")
        let newUser = ["name": name, "email": email] as [String : Any]
        let childUpdates = ["/\(String(describing: FirebaseHelper.getCurrentUser()!.uid))/": newUser]
        usersRef.updateChildValues(childUpdates)
        //completionBlock()
        
    }
    
    static func newPostWithImage(selectedImage: UIImage, name: String, description: String, date: Date){
        let data = UIImagePNGRepresentation(selectedImage)!
         let imageRef = Storage.storage().reference().child("postImages/" + name.trimmingCharacters(in: .whitespaces) + ".png")
        
        imageRef.putData(data, metadata: nil) { (metadata, error) in
            guard let metadata = metadata else {
                print("Error uploading")
                MKFullSpinner.hide()
                return
            }
            let downloadURL = String(describing: metadata.downloadURL()!)
            print(downloadURL)
            newPost(name: name, description: description, pictureURL: downloadURL, date: date, completion: completion)
        
        
    }
    static func newPost(name: String, description: String, pictureURL: String, date: Date, completion: @escaping ()->()) {
        let posterId = FirebaseAuthHelper.getCurrentUser()?.uid
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, h:mm a"
        let dateString = dateFormatter.string(from: date)
        let postsRef = Database.database().reference().child("Posts")
        let newPost = ["name": name, "pictureURL": pictureURL, "posterId": posterId!, "description": description, "date": dateString] as [String : Any]
        let key = postsRef.childByAutoId().key
        let childUpdates = ["/\(key)/": newPost]
        postsRef.updateChildValues(childUpdates)
        print("Post created!")
        completion()
    }
}



