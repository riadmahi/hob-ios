//
//  ViewModel.swift
//  Hob
//
//  Created by Riad on 19/11/2024.
//

import Foundation

extension ValuesAndPriorityView {
    
    class ViewModel: ObservableObject {
        @Published var selectedReligion: String?
        @Published var selectedPractice: String?
        @Published var selectedImportance: String?
        @Published var selectedValues: [String] = []
        @Published var isLoading: Bool = false
        
        let repository: HobRepository
        
        private var profile: Profile?
        
        init(repository: HobRepository) {
            self.repository = repository
            self.fetchProfileData()
        }
        
        func fetchProfileData() {
            isLoading = true
            repository.getProfile { result in
                self.isLoading = false
                switch result {
                case .success(let profile):
                    self.profile = profile
                    if let religion = profile.spirituality {
                        self.selectedReligion = religion
                    }
                    if let selectedPractice = profile.spiritualityPractice {
                        self.selectedPractice = selectedPractice
                    }
                    if let spiritualityImportance = profile.spiritualityImportance {
                        self.selectedImportance = spiritualityImportance
                    }
                    if let values = profile.values {
                        self.selectedValues = values
                    }
                case .failure(let error):
                    print("Error fetching profile: \(error.localizedDescription)")
                }
            }
        }
        
        func updateProfile() {
            guard let profile = self.profile else {
                print("No profile data available to update.")
                return
            }
            
            var updatedData: [String: Any] = [:]
            
            if let selectedReligion = self.selectedReligion, !selectedReligion.isEmpty {
                updatedData["spirituality"] = selectedReligion
            }
            if let selectedPractice = self.selectedPractice, !selectedPractice.isEmpty {
                updatedData["spiritualityPractice"] = selectedPractice
            }
            if let selectedImportance = self.selectedImportance, !selectedImportance.isEmpty {
                updatedData["spiritualityImportance"] = selectedImportance
            }
            if !selectedValues.isEmpty {
                updatedData["values"] = selectedValues
            }
            
            guard !updatedData.isEmpty else {
                print("No changes detected.")
                return
            }
            
            repository.updateProfile(updatedData: updatedData) { result in
                switch result {
                case .success():
                    print("Profile updated successfully.")
                case .failure(let error):
                    print("Error updating profile: \(error.localizedDescription)")
                }
            }
        }
        
        func moveToQuiz() {
            var updatedData: [String: Any] = [:]
            updatedData["onBoardingStep"] = SignUpStep.quiz.rawValue
            
            repository.updateUserPreferences(updatedData: updatedData) { result in
                switch result {
                case .success():
                    print("User preferences updated successfully.")
                case .failure(let error):
                    print("Error updating user preferences: \(error.localizedDescription)")
                }
            }
        }
        
    }
}
