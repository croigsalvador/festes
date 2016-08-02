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
import CoreLocation

class UserNetworkProvider: NSObject {
    
    let fireBaseReference : FIRDatabaseReference = FIRDatabase.database().reference()
    
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
    
    func currentUser() -> User? {
        let firUser = FIRAuth.auth()?.currentUser;
        if firUser != nil {
            return User(userId: firUser!.uid, email : firUser!.email!, password : "" )
        }
        return nil
        
    }
    
    func logOut() {
        try! FIRAuth.auth()?.signOut()
        
    }
    func findAllUsers () {
        let users = (self.fireBaseReference.child("users").queryLimitedToFirst(100))
        users.observeEventType(.ChildAdded, withBlock: { snapshot in
            let latitude = snapshot.value!["latitude"] as! Double
            print(latitude)
        })
    }
    
    func updateLoggedUserLocation(location : CLLocation) {
        let firUser = FIRAuth.auth()?.currentUser;
        self.fireBaseReference.child("users").child(firUser!.uid).setValue(["latitude": location.coordinate.latitude, "longitude" : location.coordinate.longitude]) { (error, databaseReference) in
            print(databaseReference)
        }
    }
    
}
