//
//  ForgotPasswordView.swift
//  Hob
//
//  Created by Riad on 08/11/2024.
//

import SwiftUI
import FirebaseAuth
import SimpleToast

struct ForgotPasswordView: View {
    @StateObject private var viewModel: ViewModel
    private let toastOptions = SimpleToastOptions(alignment: .bottom, hideAfter: 5)

    init(auth: Auth) {
        _viewModel = StateObject(wrappedValue: ViewModel(auth: auth))
    }
    
    var body: some View {
        VStack(spacing: 48) {
            AuthStepHeader(
                screenName: "Connexion",
                displayName: "Mot de passe oublié ? 😱",
                subtitle: "Pas d’inquiétude, renseigne ton adresse mail et on s’occupe de tout."
            )
            
            HobTextField(hint: "Email", text: $viewModel.email, uiKeyboardType: .emailAddress)
            
            if viewModel.isLoading {
                ProgressView()
            } else {
                HobButton(
                    text: "Envoyer le lien de réinitialisation",
                    width: .infinity
                ) {
                    viewModel.sendResetPasswordLink()
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
        .simpleToast(isPresented: $viewModel.showSuccessToast, options: toastOptions) {
                    Label("Un lien de réinitialisation a été envoyé à votre email.", systemImage: "checkmark.circle.fill")
                        .padding()
                        .background(Color("SecondaryContainerColor").opacity(0.7).blur(radius: 10))
                        .foregroundColor(Color("SuccessColor"))
                        .cornerRadius(10)
                        .padding(.bottom)
                }
        .padding(.top, 48)
        .padding(.horizontal, 10)
    }
}

#Preview {
    ForgotPasswordView(auth: Auth.auth())
}
