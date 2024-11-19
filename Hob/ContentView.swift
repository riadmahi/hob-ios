//
//  ContentView.swift
//  Hob
//
//  Created by Riad on 06/11/2024.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @StateObject private var viewModel: ViewModel
    
    init(auth: Auth, repository: HobRepository) {
        _viewModel = StateObject(wrappedValue: ViewModel(auth: auth, repository: repository))
    }
    
    var body: some View {
        if viewModel.isAuthenticated {
            MainView()
            //OnBoardingView()
            //ViewProfileView()
        } else {
            WelcomeView(auth: viewModel.auth, repository: viewModel.repository)
        }
    }
}

extension ContentView {
    class ViewModel: ObservableObject {
        @Published var isAuthenticated = false
        let auth: Auth
        let repository: HobRepository
        
        init(auth: Auth, repository: HobRepository) {
            self.auth = auth
            self.repository = repository
            self.checkIfUserIsAuthenticated()
        }
        
        func checkIfUserIsAuthenticated() {
            isAuthenticated = auth.currentUser?.uid != nil
        }
    }
}

#Preview {
    ContentView(auth: Auth.auth(), repository: HobRepository())
        .preferredColorScheme(.dark)
}
