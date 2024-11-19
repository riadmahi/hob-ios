//
//  SignInViewModel.swift
//  Hob
//
//  Created by Riad on 08/11/2024.
//

import Foundation
import FirebaseAuth

extension SignUpView {
    
    class ViewModel: ObservableObject {
        let auth: Auth
        let repository: HobRepository
        @Published var email: String = ""
        @Published var password: String = ""
        @Published var isPasswordVisible: Bool = false
        @Published var errorMessage: String? = nil
        @Published var isLoading = false
        @Published var isAuthenticated = false
        @Published var showErrorToast = false
        
        init(auth: Auth, repository: HobRepository) {
            self.auth = auth
            self.repository = repository
        }
        
        func signUp() {
            guard isValidEmail(email) else {
                errorMessage = "Adresse e-mail invalide."
                showErrorToast = true
                return
            }
            isLoading = true
            errorMessage = nil
            auth.createUser(withEmail: email, password: password) { [weak self] result, error in
                DispatchQueue.main.async {
                    self?.isLoading = false
                    if let error = error {
                        self?.errorMessage = error.localizedDescription
                        self?.showErrorToast = true
                    } else {
                        self?.repository.signUp(email: self?.email ?? "", result: { result in
                            switch result {
                            case .success():
                                self?.isAuthenticated = true
                            case .failure(let error):
                                self?.errorMessage = error.localizedDescription
                                self?.showErrorToast = true
                            }
                        })
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
