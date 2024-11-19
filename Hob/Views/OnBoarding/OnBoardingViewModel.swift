//
//  OnBoardingViewModel.swift
//  Hob
//
//  Created by Riad on 19/11/2024.
//
import Foundation

extension OnBoardingView {

    class ViewModel: ObservableObject {
        let repository: HobRepository
        
        @Published var currentStep: SignUpStep = .general
        
        init(repository: HobRepository) {
            self.repository = repository
            getCurrentStep()
        }
        
        func getCurrentStep() {
            repository.getProfilePreferences { result in
                switch result {
                case .success(let profilePreferences):
                    self.currentStep = profilePreferences.onBoardingStep ?? .general
                case .failure(let error):
                    print("Error fetching profile preferences: \(error.localizedDescription)")
                }
            }
        }
    }
}
