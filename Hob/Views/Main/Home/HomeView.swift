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
                        .scrollTransition(.animated(.easeInOut(duration: 0.5))) { content, phase in
                            content
                                .opacity(opacityAmount(for: phase))
                                .scaleEffect(scaleAmount(for: phase))
                                .blur(radius: blurAmount(for: phase))
                        }
                }
            }
            .scrollTargetLayout()
            .padding(.bottom, 60)
        }
        .scrollTargetBehavior(.viewAligned)
    }
    
    nonisolated private func blurAmount(for phase: ScrollTransitionPhase) -> CGFloat {
        10 * abs(phase.value)
    }

    nonisolated private func opacityAmount(for phase: ScrollTransitionPhase) -> CGFloat {
        1 - abs(phase.value)
    }

    nonisolated private func scaleAmount(for phase: ScrollTransitionPhase) -> CGFloat {
        1 - (abs(phase.value) * 0.1)
    }
}


#Preview {
    HomeView(auth: Auth.auth())
        .preferredColorScheme(.dark)
}
