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
    @Environment(\.dismiss) private var dismiss
    @Namespace private var animationNamespace
    var body: some View {
        ZStack {
            switch currentStep {
            case .spirituality:
                SpiritualityView {
                    goToNextStep()
                }
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                
            case .spiritualityPractice:
                SpiritualityPracticeView {
                    goToNextStep()
                }
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                
            case .spiritualityImportance:
                SpiritualityImportanceView {
                    goToNextStep()
                }
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                
            case .values:
                ValuesView {
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
            if let nextStep = ValuesAndPriorityStep(rawValue: currentStep.rawValue + 1) {
                currentStep = nextStep
            }
        }
    }
}
