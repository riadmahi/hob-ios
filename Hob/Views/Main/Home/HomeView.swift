//
//  HomeView.swift
//  Hob
//
//  Created by Riad on 08/11/2024.
//

import SwiftUI
import FirebaseAuth

struct HomeView : View {
    @StateObject private var viewModel: ViewModel
    
    init(auth: Auth) {
        _viewModel = StateObject(wrappedValue: ViewModel(auth: auth))
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .center) {
                ForEach(0..<8) { _ in
                    ProfileCard()
                        .frame(height: 600)
                        .padding(.horizontal, 12)
                        .padding(.bottom, 32)
                    
                }
            }
        }
        
    }
}

#Preview {
    HomeView(auth: Auth.auth())
        .preferredColorScheme(.dark)
}
