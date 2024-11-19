//
//  MainViewModel.swift
//  Hob
//
//  Created by Riad on 19/11/2024.
//

import Foundation

extension MainView {
    
    class ViewModel: ObservableObject {
        
        @Published var profile: Profile?
        @Published var preferences: UserPreferences?
        @Published var isLoading: Bool = false
        @Published var selectedTab: HobTab = .explore

        let repository: HobRepository
        
        init(repository: HobRepository) {
            self.repository = repository
            fetchProfile()
            fetchUserPreferences()
        }
        
        func fetchProfile() {
            isLoading = true
            repository.getProfile { result in
                self.isLoading = false
                switch result {
                case .success(let profile):
                    self.profile = profile
                case .failure(let error):
                    print("Error fetching profile: \(error.localizedDescription)")
                }
            }
        }
        
        func fetchUserPreferences() {
            isLoading = true
            repository.getProfilePreferences { result in
                self.isLoading = false
                switch result {
                case .success(let preferences):
                    self.preferences = preferences
                    if preferences.state == .chatting {
                        self.selectedTab = .chat
                    } else {
                        self.selectedTab = .explore
                    }
                    print("User preferences: \(preferences)")
                case .failure(let error):
                    print("Error fetching user preferences: \(error.localizedDescription)")
                }
            }
        }
    }
}
