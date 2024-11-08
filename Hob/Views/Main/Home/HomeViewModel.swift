//
//  HomeViewModel.swift
//  Hob
//
//  Created by Riad on 08/11/2024.
//
import Foundation
import FirebaseAuth

extension HomeView {
    
    class ViewModel: ObservableObject {
        let auth: Auth
        
        init(auth: Auth) {
            self.auth = auth
        }
    }
}
