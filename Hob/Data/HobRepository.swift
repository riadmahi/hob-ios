//
//  UserRepository.swift
//  Hob
//
//  Created by Riad on 19/11/2024.
//

import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage

class HobRepository {
    
    private let auth = Auth.auth()
    private let db = Firestore.firestore()
    private let storage = Storage.storage()
    
    let profilesRef: CollectionReference
    let userPreferencesRef: CollectionReference
    
    init() {
        self.profilesRef = db.collection("profiles")
        self.userPreferencesRef = db.collection("userPreferences")
    }
    
    /**
     --------------------------------     User Repository     --------------------------------
     */
    func signUp(email: String, result: @escaping (Result<Void, Error>) -> Void) {
        guard let currentUser = auth.currentUser else {
            result(.failure(NSError(domain: "AuthError", code: 0, userInfo: [NSLocalizedDescriptionKey: "User not authenticated."])))
            return
        }
        
        let profileData: [String: Any] = [
            "email": email,
            "uid": currentUser.uid
        ]
        
        let userPrefData: [String: Any] = [
            "uid": currentUser.uid,
            "isComplete": false,
            "onBoardingStep": SignUpStep.general.rawValue
        ]
        
        let profileDocRef = profilesRef.document(currentUser.uid)
        let userPrefDocRef = userPreferencesRef.document(currentUser.uid)
        
        let batch = db.batch()
        batch.setData(profileData, forDocument: profileDocRef)
        batch.setData(userPrefData, forDocument: userPrefDocRef)
        
        batch.commit { error in
            if let error = error {
                result(.failure(error))
            } else {
                result(.success(()))
            }
        }
    }
    
    func getProfilePreferences(result: @escaping (Result<ProfilePreferences, Error>) -> Void) {
        guard let currentUser = auth.currentUser else {
            result(.failure(NSError(domain: "AuthError", code: 0, userInfo: [NSLocalizedDescriptionKey: "User not authenticated."])))
            return
        }
        let userPrefDocRef = userPreferencesRef.document(currentUser.uid)
        
        userPrefDocRef.getDocument { document, error in
            if let error = error {
                result(.failure(error))
            } else if let document = document, document.exists {
                do {
                    let data = try document.data(as: ProfilePreferences.self)
                    result(.success(data))
                } catch {
                    result(.failure(error))
                }
            } else {
                result(.failure(NSError(domain: "FirestoreError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Profile data not found."])))
            }
        }
    }
    
    func getProfile(result: @escaping (Result<Profile, Error>) -> Void) {
        guard let currentUser = auth.currentUser else {
            result(.failure(NSError(domain: "AuthError", code: 0, userInfo: [NSLocalizedDescriptionKey: "User not authenticated."])))
            return
        }
        let profileDocRef = profilesRef.document(currentUser.uid)
        
        profileDocRef.getDocument { document, error in
            if let error = error {
                result(.failure(error))
            } else if let document = document, document.exists {
                do {
                    let data = try document.data(as: Profile.self)
                    result(.success(data))
                } catch {
                    result(.failure(error))
                }
            } else {
                result(.failure(NSError(domain: "FirestoreError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Profile data not found."])))
            }
        }
    }
    
    func updateProfile(updatedData: [String: Any], result: @escaping (Result<Void, Error>) -> Void) {
        guard let currentUser = auth.currentUser else {
            result(.failure(NSError(domain: "AuthError", code: 0, userInfo: [NSLocalizedDescriptionKey: "User not authenticated."])))
            return
        }
        let profileDocRef = profilesRef.document(currentUser.uid)
        profileDocRef.updateData(updatedData) { error in
            if let error = error {
                result(.failure(error))
            } else {
                result(.success(()))
            }
        }
    }
}
