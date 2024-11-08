//
//  LoginView.swift
//  Hob
//
//  Created by Riad on 07/11/2024.
//

import SwiftUI
import FirebaseAuth
import SimpleToast

struct SignInView: View {
    @StateObject private var viewModel: ViewModel
    
    init(auth: Auth) {
        _viewModel = StateObject(wrappedValue: ViewModel(auth: auth))
    }
    
    private let toastOptions = SimpleToastOptions(hideAfter: 5)
    
    var body: some View {
        VStack(spacing: 48) {
            AuthStepHeader(
                screenName: "Connexion",
                displayName: "Heureux de te revoir 👋🏽"
            )
            VStack(spacing: 24) {
                HobTextField(hint: "Email", text: $viewModel.email)
                
                SecureHobTextField(
                    hint: "Mot de passe",
                    password: $viewModel.password,
                    isPasswordVisible: $viewModel.isPasswordVisible)
                
                Text("Mot de passe oublié?")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .font(.brSonomaFont(.medium, 14))
                    .foregroundColor(Color("PlaceholderColor"))
                    .onTapGesture {
                        viewModel.isPasswordForgotten = true
                    }
            }
            if viewModel.isLoading {
                ProgressView()
            } else {
                HobButton(
                    text: "Se connecter",
                    width: .infinity
                ) {
                    viewModel.login()
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
        .navigationDestination(isPresented: $viewModel.isPasswordForgotten) {
            ForgotPasswordView(auth: viewModel.auth)
        }
    }
}

#Preview {
    SignInView(auth: Auth.auth())
        .preferredColorScheme(.dark)
}
