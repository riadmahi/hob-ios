//
//  MainView.swift
//  Hob
//
//  Created by Riad on 09/11/2024.
//


import SwiftUI
import FirebaseAuth

struct MainView : View {
    @State private var selectedTab: HobTab = .chat

    var body: some View {
        ZStack {
            VStack {
                MainTopBar()
                Spacer()
                switch selectedTab {
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
                HobTabView(selectedTab: $selectedTab)
            }
            .padding(.bottom, 24)
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    HomeView(auth: Auth.auth())
        .preferredColorScheme(.dark)
}
