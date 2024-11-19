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
    @StateObject private var viewModel: ViewModel
    @Environment(\.dismiss) private var dismiss
    @Namespace private var animationNamespace
    
    init(repository: HobRepository) {
        _viewModel = StateObject(wrappedValue: ViewModel(repository: repository))
    }
    
    var body: some View {
        ZStack {
            switch currentStep {
            case .birthdate:
                BirthDateView(birthDate: $viewModel.birthDate,next: { goToNextStep() }, back: { withAnimation { dismiss() } })
                    .transition(currentTransition)
                
            case .gender:
                GenderView(gender: $viewModel.gender, next: { goToNextStep() }, back: { goToPreviousStep() })
                    .transition(currentTransition)
                
            case .displayName:
                DisplayNameView(name: $viewModel.displayName, next: { goToNextStep() }, back: { goToPreviousStep() })
                    .transition(currentTransition)
                
            case .job:
                JobView(job: $viewModel.job, next: { goToNextStep() }, back: { goToPreviousStep() })
                    .transition(currentTransition)
                
            case .origins:
                OriginsView(selectedOrigins: $viewModel.origins, next: { goToNextStep() }, back: { goToPreviousStep() })
                    .transition(currentTransition)
                
            case .interests:
                InterestsView(selectedInterests: $viewModel.interests,next: { goToNextStep() }, back: { goToPreviousStep() })
                    .transition(currentTransition)
                
            case .biography:
                BiographyView(biography: $viewModel.biography, next: { withAnimation { dismiss() } }, back: { goToPreviousStep() })
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

extension GeneralView {
    class ViewModel: ObservableObject {
        @Published var birthDate: Date = Date.now
        @Published var gender: Gender?
        @Published var displayName: String = ""
        @Published var interests: [String] = []
        @Published var origins: [String]  = []
        @Published var job: String = ""
        @Published var biography: String = ""
        
        let repository: HobRepository
        
        init(repository: HobRepository) {
            self.repository = repository
        }
    }
}
