//
//  UserNetworkProvider.swift
//  Festes
//
//  Created by Carlos Roig on 01/08/16.
//  Copyright © 2016 Festes. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class UserNetworkProvider: NSObject {
    func createUserWithEmailAndPassword(email : String, password : String ,  completion: (user : User?, error : NSError?) -> Void) {
        FIRAuth.auth()?.createUserWithEmail(email, password: password) { (user, error) in
                if let error = error {
                    completion(user: nil, error: error)
                    return
                }
            
            let myUser : User = User(userId: user!.uid, email: email, password: password)
            completion(user: myUser, error: nil)
        }
    }
    
    
    func loginUserWithEmailAndPassword(email : String, password : String ,  completion: (user : User?, error : NSError?) -> Void) {
        FIRAuth.auth()?.signInWithEmail(email, password: password) { (user, error) in
            if let error = error {
                completion(user: nil, error: error)
                return
            }
            
            let myUser : User = User(userId: user!.uid, email: email, password: password)
            completion(user: myUser, error: nil)
        }
    }

    
}
