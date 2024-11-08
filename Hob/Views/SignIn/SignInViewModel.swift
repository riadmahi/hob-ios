//
//  SignInViewModel.swift
//  Hob
//
//  Created by Riad on 08/11/2024.
//

import SwiftUI
import FirebaseAuth

extension SignInView {
    
    class ViewModel: ObservableObject {
        let auth: Auth
        @Published var email: String = ""
        @Published var password: String = ""
        @Published var isPasswordVisible: Bool = false
        @Published var isPasswordForgotten: Bool = false
        @Published var errorMessage: String? = nil
        @Published var isLoading = false
        @Published var isAuthenticated = false
        @Published var showErrorToast = false
        
        init(auth: Auth) {
            self.auth = auth
        }
        
        func login() {
            guard isValidEmail(email) else {
                errorMessage = "Adresse e-mail invalide."
                showErrorToast = true
                return
            }
            isLoading = true
            errorMessage = nil
            auth.signIn(withEmail: email, password: password) { [weak self] result, error in
                DispatchQueue.main.async {
                    self?.isLoading = false
                    if let error = error {
                        self?.errorMessage = error.localizedDescription
                        self?.showErrorToast = true
                    } else {
                        self?.isAuthenticated = true
                    }
                }
            }
        }
        
        func isValidEmail(_ email: String) -> Bool {
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,}"
            let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
            return emailTest.evaluate(with: email)
        }
    }
}
