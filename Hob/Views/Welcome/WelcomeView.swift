//
//  WelcomeView.swift
//  Hob
//
//  Created by Riad on 06/11/2024.
//

import SwiftUI

struct WelcomeView: View {
    @State private var isVisible: Bool = false
    var body: some View {
        ZStack {
            background
            
            RadialGradient(gradient: Gradient(colors: [Color.clear, Color.black]), center: .center, startRadius: 0, endRadius: 400)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 32) {
                
                Image("BrandIcon")
                    .opacity(isVisible ? 1 : 0)
                    .transition(.scale)
                    .animation(.easeInOut(duration: 1), value: isVisible)
                
                Spacer()
                
                Text("Une app de rencontres pensée pour des connexions authentiques et durables")
                    .brSonomaFont(.black, 24)
                    .padding(.horizontal, 20)
                    .multilineTextAlignment(.leading)
                    .opacity(isVisible ? 1 : 0)
                    .transition(.move(edge: .bottom))
                    .animation(.easeInOut(duration: 1).delay(0.5), value: isVisible)
               
                VStack(spacing: 12){
                    
                    HobButton(text: "S'inscrire", width: .infinity) {
                        
                    }
                    
                    GhostHobButton(text: "Se connecter ", width: .infinity) {
                        
                    }
                }
                .opacity(isVisible ? 1 : 0)
                .offset(y: isVisible ? 0 : 50)
                .animation(.easeInOut(duration: 1).delay(1), value: isVisible)
                .padding(.horizontal, 20)
            }
            .padding(.horizontal, 90)
            .padding(.bottom, 60)
            .onAppear {
                isVisible = true
            }
        }
    }
    
    private var background: some View {
        AsyncImage(url: URL(string: "https://images.unsplash.com/photo-1541976844346-f18aeac57b06?q=80&w=2448&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")) { result in
            result.image?
                .resizable()
                .scaledToFill()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
}


#Preview {
    WelcomeView()
        .preferredColorScheme(.dark)
}
