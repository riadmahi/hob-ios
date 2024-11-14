//
//  GeneralView.swift
//  Hob
//
//  Created by Riad on 14/11/2024.
//

import SwiftUI

enum GeneralStep: Int, CaseIterable {
    case birthdate
    case gender
    case displayName
    case job
    case interests
    case biography
}

struct GeneralView: View {
    @State private var currentStep: GeneralStep = .birthdate
    @Environment(\.dismiss) private var dismiss
    @Namespace private var animationNamespace
    var body: some View {
        ZStack {
            switch currentStep {
            case .birthdate:
                BirthDateView {
                    goToNextStep()
                }
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                
            case .gender:
                GenderView {
                    goToNextStep()
                }
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                
            case .displayName:
                DisplayNameView {
                    goToNextStep()
                }
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
              
            case .job:
                JobView {
                    goToNextStep()
                }
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                
            case .interests:
                InterestsView {
                    goToNextStep()
                }
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
            case .biography:
                BiographyView {
                    withAnimation {
                        dismiss()
                    }
                }
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
            }
        }
        .animation(.easeInOut(duration: 0.5), value: currentStep)
    }
    
    private func goToNextStep() {
        withAnimation {
            if let nextStep = GeneralStep(rawValue: currentStep.rawValue + 1) {
                currentStep = nextStep
            }
        }
    }
}
