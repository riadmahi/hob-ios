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
        VStack {
           Text("HomeView")
        }
    }
}

#Preview {
    HomeView(auth: Auth.auth())
        .preferredColorScheme(.dark)
}
