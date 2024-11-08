//
//  OnBoardingStepHeader.swift
//  Hob
//
//  Created by Riad on 08/11/2024.
//

import SwiftUI

struct AuthStepHeader: View {
    let screenName: String
    let displayName: String
    var subtitle: String?
    
    var body: some View {
        VStack(spacing: 8) {
            Text(screenName)
                .brSonomaFont(.regular, 13)
            Text(displayName)
                .brSonomaFont(.black, 20)
            if let subtitleText = subtitle {
                Text(subtitleText)
                    .brSonomaFont(.regular, 15)
                    .foregroundColor(Color("PlaceholderColor"))
                    .multilineTextAlignment(.center)
            }
        }
        .padding(.horizontal, 42)
    }
}

#Preview {
    AuthStepHeader(screenName: "Connexion", displayName: "Heureux de te revoir 👋🏽")
}
