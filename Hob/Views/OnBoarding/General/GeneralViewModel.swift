//
//  GeneralViewModel.swift
//  Hob
//
//  Created by Riad on 19/11/2024.
//

import Foundation

extension GeneralView {
    class ViewModel: ObservableObject {
        @Published var birthDate: Date = Date.now
        @Published var gender: Gender?
        @Published var displayName: String = ""
        @Published var interests: [String] = []
        @Published var origins: [String]  = []
        @Published var job: String = ""
        @Published var biography: String = ""
        @Published var isLoading: Bool = false
        
        let repository: HobRepository
        var profile: Profile?
        
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
                    if let displayName = profile.name {
                        self.displayName = displayName
                    }
                    if let birthDate = profile.birthDate {
                        self.birthDate = birthDate
                    }
                    if let gender = profile.gender {
                        self.gender = gender
                    }
                    if let interests = profile.interests {
                        self.interests = interests
                    }
                    if let origins = profile.origins {
                        self.origins = origins
                    }
                    if let job = profile.job {
                        self.job = job
                    }
                    if let biography = profile.biography {
                        self.biography = biography
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
            
            // Only update non-nil values
            if !displayName.isEmpty {
                updatedData["name"] = displayName
            }
            updatedData["birthDate"] = birthDate
            if let gender = self.gender {
                updatedData["gender"] = gender.rawValue // Assuming Gender is an enum
            }
            if !interests.isEmpty {
                updatedData["interests"] = interests
            }
            if !origins.isEmpty {
                updatedData["origins"] = origins
            }
            if !job.isEmpty {
                updatedData["job"] = job
            }
            if !biography.isEmpty {
                updatedData["biography"] = biography
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
    }
}
