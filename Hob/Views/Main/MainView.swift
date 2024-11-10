//
//  MainView.swift
//  Hob
//
//  Created by Riad on 09/11/2024.
//


import SwiftUI
import FirebaseAuth

struct MainView : View {
    @State private var selectedTab: HobTab = .explore

    var body: some View {
        ZStack {
            switch selectedTab {
            case .explore:
                HomeView(auth: Auth.auth())
            case .notes:
                NotesView()
            case .chat:
                ChatView()
            }
            
            VStack {
                Spacer()
                HobTabView(selectedTab: $selectedTab)
            }
            .padding(.bottom, 24)
        }
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    HomeView(auth: Auth.auth())
        .preferredColorScheme(.dark)
}
