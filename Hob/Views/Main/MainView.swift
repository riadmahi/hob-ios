//
//  MainView.swift
//  Hob
//
//  Created by Riad on 09/11/2024.
//


import SwiftUI
import FirebaseAuth

struct MainView : View {
    @StateObject private var viewModel: ViewModel
    
    init(auth: Auth, repository: HobRepository) {
        _viewModel = StateObject(wrappedValue: ViewModel(repository: repository))
    }
    
    var body: some View {
        ZStack {
            if viewModel.isLoading {
                ProgressView()
            } else {
                VStack {
                    if viewModel.selectedTab != .chat, let profile = viewModel.profile {
                        MainTopBar(profile: profile)
                    }
                    Spacer()
                    switch viewModel.selectedTab  {
                    case .explore:
                        HomeView(auth: Auth.auth())
                    case .notes:
                        NotesView()
                    case .chat:
                        ChatView()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                VStack {
                    Spacer()
                    HobTabView(selectedTab: $viewModel.selectedTab)
                }
                .padding(.bottom, 24)
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomeView(auth: Auth.auth())
        .preferredColorScheme(.dark)
}
