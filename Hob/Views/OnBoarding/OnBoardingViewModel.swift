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
        @Published var isComplete: Bool = false
        
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
        
        func finish() {
            var updatedData: [String: Any] = [:]
            updatedData["isComplete"] = true
            repository.updateUserPreferences(updatedData: updatedData) { result in
                switch result {
                case .success():
                    print("Profile updated successfully.")
                    self.isComplete = true
                case .failure(let error):
                    print("Error updating profile: \(error.localizedDescription)")
                }
            }
        }
        
    }
}
