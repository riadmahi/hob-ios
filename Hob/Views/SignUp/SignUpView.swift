//
//  SignUpView.swift
//  Hob
//
//  Created by Riad on 07/11/2024.
//

import SwiftUI
import FirebaseAuth
import SimpleToast

struct SignUpView: View {
    @StateObject private var viewModel: ViewModel
    
    init(auth: Auth, repository: HobRepository) {
        _viewModel = StateObject(wrappedValue: ViewModel(auth: auth, repository: repository))
    }
    
    private let toastOptions = SimpleToastOptions(alignment: .bottom, hideAfter: 5)
    
    var body: some View {
        VStack(spacing: 48) {
            AuthStepHeader(
                screenName: "Inscription",
                displayName: "Créer ton compte ✨"
            )
            VStack(spacing: 24) {
                HobTextField(hint: "Email", text: $viewModel.email, uiKeyboardType: .emailAddress)
                
                SecureHobTextField(
                    hint: "Mot de passe",
                    password: $viewModel.password,
                    isPasswordVisible: $viewModel.isPasswordVisible)
            }
            if viewModel.isLoading {
                ProgressView()
            } else {
                VStack(spacing: 12){
                    Text("En cliquant sur créer mon compte, vous acceptez les \(Text("[Termes et Conditions](https://www.hobdating.com/terms)").underline()                                    .foregroundColor(Color("AccentColor"))) de Hob Dating")
                        .brSonomaFont(.regular, 15)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HobButton(
                        text: "S'inscrire",
                        width: .infinity
                    ) {
                        viewModel.signUp()
                    }
                }
            }
            Spacer()
        }
        .simpleToast(isPresented: $viewModel.showErrorToast, options: toastOptions) {
            Label(viewModel.errorMessage ?? "Une erreur est survenue, veillez réassayer plus tard", systemImage: "xmark.circle.fill")
                .padding()
                .background(Color("SecondaryContainerColor").opacity(0.7).blur(radius: 10))
                .foregroundColor(Color("ErrorColor"))
                .cornerRadius(10)
                .padding(.bottom)
        }
        .padding(.top, 48)
        .padding(.horizontal, 10)
        .navigationDestination(isPresented: $viewModel.isAuthenticated) {
            OnBoardingView()
        }
    }
}

#Preview {
    SignUpView(auth: Auth.auth(), repository: HobRepository())
}
