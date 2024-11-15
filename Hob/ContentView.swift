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
    
    init(auth: Auth) {
        _viewModel = StateObject(wrappedValue: ViewModel(auth: auth))
    }
    
    var body: some View {
        if viewModel.isAuthenticated {
            //MainView()
            OnBoardingView()
            //OriginsView(next: {}, back: {})
        } else {
            WelcomeView(auth: viewModel.auth)
        }
    }
}

extension ContentView {
    class ViewModel: ObservableObject {
        @Published var isAuthenticated = false
        let auth: Auth
        
        init(auth: Auth) {
            self.auth = auth
            self.checkIfUserIsAuthenticated()
        }
        
        func checkIfUserIsAuthenticated() {
            isAuthenticated = auth.currentUser?.uid != nil
        }
    }
}

#Preview {
    ContentView(auth: Auth.auth())
        .preferredColorScheme(.dark)
}
