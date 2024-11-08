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
    
    var body: some View {
        VStack(spacing: 8) {
            Text(screenName)
                .brSonomaFont(.regular, 13)
            Text(displayName)
                .brSonomaFont(.black, 20)
        }
    }
}

#Preview {
    AuthStepHeader(screenName: "Connexion", displayName: "Heureux de te revoir 👋🏽")
}
