//
//  ValuesAndPriorityView.swift
//  Hob
//
//  Created by Riad on 14/11/2024.
//

import SwiftUI

enum ValuesAndPriorityStep: Int, CaseIterable {
    case spirituality
    case spiritualityPractice
    case spiritualityImportance
    case values
}

struct ValuesAndPriorityView: View {
    @State private var currentStep: ValuesAndPriorityStep = .spirituality
    @State private var navigationDirection: NavigationDirection = .forward
    @Environment(\.dismiss) private var dismiss
    @Namespace private var animationNamespace
    
    var body: some View {
        ZStack {
            switch currentStep {
            case .spirituality:
                SpiritualityView(next: { goToNextStep() }, back: { withAnimation { dismiss() } })
                .transition(currentTransition)

            case .spiritualityPractice:
                SpiritualityPracticeView(next: { goToNextStep() }, back: { goToPreviousStep() })
                .transition(currentTransition)

            case .spiritualityImportance:
                SpiritualityImportanceView(next: { goToNextStep() }, back: { goToPreviousStep() })
                .transition(currentTransition)

            case .values:
                ValuesView(next: { withAnimation { dismiss() } }, back: { goToPreviousStep() })
                .transition(currentTransition)
            }
        }
        .animation(.easeInOut(duration: 0.5), value: currentStep)
        .navigationBarBackButtonHidden(true)
    }
    
    private func goToNextStep() {
        withAnimation {
            navigationDirection = .forward
            if let nextStep = ValuesAndPriorityStep(rawValue: currentStep.rawValue + 1) {
                currentStep = nextStep
            }
        }
    }
    
    private func goToPreviousStep() {
        withAnimation {
            navigationDirection = .backward
            if let previousStep = ValuesAndPriorityStep(rawValue: currentStep.rawValue - 1) {
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
