//
//  LoginView.swift
//  Hob
//
//  Created by Riad on 07/11/2024.
//

import SwiftUI

struct SignInView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var isPasswordForgotten: Bool = false
    
    var body: some View {
        VStack(spacing: 48) {
            AuthStepHeader(
                screenName: "Connexion",
                displayName: "Heureux de te revoir 👋🏽"
            )
            VStack(spacing: 24) {
                HobTextField(hint: "Email", text: $email)
                
                SecureHobTextField(
                    hint: "Mot de passe",
                    password: $password,
                    isPasswordVisible: $isPasswordVisible)
                
                Text("Mot de passe oublié?")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .font(.brSonomaFont(.medium, 14))
                    .foregroundColor(Color("PlaceholderColor"))
                    .onTapGesture {
                        isPasswordForgotten = true
                    }
            }
            
            HobButton(text: "Se connecter", width: .infinity) {
                
            }
            Spacer()
        }
        .padding(.top, 48)
        .padding(.horizontal, 10)
    }
}

#Preview {
    SignInView()
        .preferredColorScheme(.dark)
}
