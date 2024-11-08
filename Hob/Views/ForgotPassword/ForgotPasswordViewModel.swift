//
//  ForgotPasswordViewModel.swift
//  Hob
//
//  Created by Riad on 08/11/2024.
//
import Foundation
import FirebaseAuth

extension ForgotPasswordView {
    
    class ViewModel: ObservableObject {
        let auth: Auth
        
        @Published var email: String = ""
        @Published var isLoading: Bool = false
        @Published var showErrorToast: Bool = false
        @Published var showSuccessToast: Bool = false
        @Published var errorMessage: String?

        init(auth: Auth) {
            self.auth = auth
        }
        
        func sendResetPasswordLink() {
            guard !email.isEmpty else {
                errorMessage = "Veuillez entrer votre adresse email."
                showErrorToast = true
                return
            }
            
            isLoading = true
            errorMessage = nil

            auth.sendPasswordReset(withEmail: email) { [weak self] error in
                DispatchQueue.main.async {
                    self?.isLoading = false
                    if let error = error {
                        self?.errorMessage = error.localizedDescription
                        self?.showErrorToast = true
                    } else {
                        self?.showSuccessToast = true
                    }
                }
            }
        }
    }
}
