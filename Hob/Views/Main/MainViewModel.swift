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
        @Published var isLoading: Bool = false
        
        let repository: HobRepository
        
        init(repository: HobRepository) {
            self.repository = repository
            fetchProfile()
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
    }
}
