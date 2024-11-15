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
    case origins
    case interests
    case biography
}

enum NavigationDirection {
    case forward
    case backward
}

struct GeneralView: View {
    @State private var currentStep: GeneralStep = .birthdate
    @State private var navigationDirection: NavigationDirection = .forward
    @Environment(\.dismiss) private var dismiss
    @Namespace private var animationNamespace
    var body: some View {
        ZStack {
            switch currentStep {
            case .birthdate:
                BirthDateView(next: { goToNextStep() }, back: { withAnimation { dismiss() } })
                    .transition(currentTransition)
                
            case .gender:
                GenderView(next: { goToNextStep() }, back: { goToPreviousStep() })
                    .transition(currentTransition)
                
            case .displayName:
                DisplayNameView(next: { goToNextStep() }, back: { goToPreviousStep() })
                    .transition(currentTransition)
                
            case .job:
                JobView(next: { goToNextStep() }, back: { goToPreviousStep() })
                    .transition(currentTransition)
                
            case .origins:
                OriginsView(next: { goToNextStep() }, back: { goToPreviousStep() })
                    .transition(currentTransition)
                
            case .interests:
                InterestsView(next: { goToNextStep() }, back: { goToPreviousStep() })
                    .transition(currentTransition)
                
            case .biography:
                BiographyView(next: { withAnimation { dismiss() } }, back: { goToPreviousStep() })
                    .transition(currentTransition)
            }
        }
        .animation(.easeInOut(duration: 0.5), value: currentStep)
        .navigationBarBackButtonHidden(true)
    }
    
    private func goToNextStep() {
        withAnimation {
            navigationDirection = .forward
            if let nextStep = GeneralStep(rawValue: currentStep.rawValue + 1) {
                currentStep = nextStep
            }
        }
    }
    
    private func goToPreviousStep() {
        withAnimation {
            navigationDirection = .backward
            if let previousStep = GeneralStep(rawValue: currentStep.rawValue - 1) {
                currentStep = previousStep
            }
        }
    }
    private var currentTransition: AnyTransition {
        switch navigationDirection {
        case .forward:
            return .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
        case .backward:
            return .asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing))
        }
    }
}
