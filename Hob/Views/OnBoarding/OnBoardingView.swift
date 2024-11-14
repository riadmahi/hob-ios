//
//  OnBoardingView.swift
//  Hob
//
//  Created by Riad on 14/11/2024.
//

import SwiftUI

import SwiftUI

struct OnBoardingView: View {
    var body: some View {
        VStack {
            AuthStepHeader(
                screenName: "Inscription", displayName: "Mode création",
                subtitle: "En remplissant ces questionnaires, vous trouverez des profils pépite 💎"
            )
            .padding(.bottom, 48)
            
            ZStack {
                // Dessiner la ligne courbée pointillée
                DottedCurvedLineView()
                    .padding(.top, 48) // Ajuster la position de la ligne
                
                VStack(spacing: 0) { // Espacement entre les étapes
                    OnBoardingStep(image: "FirstStepIcon", title: "Général")
                        .position(x: 100, y: 100) // Étape 1 en haut à gauche
                    
                    OnBoardingStep(image: "SecondStepIcon", title: "Valeurs & Priorités")
                        .position(x: 300, y: 50) // Étape 2 au milieu à droite
                    
                    OnBoardingStep(image: "QuizIcon", title: "Quiz de personnalité")
                        .position(x: 150, y: 50)
                }
            }
            
            Spacer()
            
            HobButton(text: "Finaliser", width: .infinity) {
                // Action à définir
            }
        }
        .padding(.horizontal, 12)
        .background(LinearGradient(colors: [Color(hex: 0x461337), .black], startPoint: .top, endPoint: .bottom))
    }
}

struct DottedCurvedLineView: View {
    var body: some View {
        Path { path in
            // Connexion de l'étape 1 à l'étape 2 (haut à gauche vers le milieu à droite)
            path.move(to: CGPoint(x: 100, y: 110))  // Point de départ (étape 1)
            
            // Première courbe vers l'étape 2 (au milieu à droite)
            path.addCurve(to: CGPoint(x: 300, y: 150),
                          control1: CGPoint(x: 150, y: 150), // Premier point de contrôle
                          control2: CGPoint(x: 250, y: 40)) // Deuxième point de contrôle
            
        }
        .stroke(style: StrokeStyle(lineWidth: 2, dash: [5, 5])) // Style pointillé
        .foregroundColor(.white) // Couleur de la ligne
        
        Path { path in
            // Connexion de l'étape 1 à l'étape 2 (haut à gauche vers le milieu à droite)
            path.move(to: CGPoint(x: 300, y: 250))  // Point de départ (étape 1)
            
            // Première courbe vers l'étape 2 (au milieu à droite)
            path.addCurve(to: CGPoint(x: 150, y: 350),
                          control1: CGPoint(x: 250, y: 350), // Premier point de contrôle
                          control2: CGPoint(x: 200, y: 280)) // Deuxième point de contrôle
            
        }
        .stroke(style: StrokeStyle(lineWidth: 2, dash: [5, 5])) // Style pointillé
        .foregroundColor(.white) // Couleur de la ligne
    }
}

struct OnBoardingStep: View {
    let image: String
    let title: String
    var body: some View {
        Button {} label: {
            VStack(spacing: -12) {
                Image(image)
                    .resizable()
                    .frame(width: 100, height: 100)
                Text(title)
                    .brSonomaFont(.semiBold, 12)
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    OnBoardingView()
        .preferredColorScheme(.dark)
}
