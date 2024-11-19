//
//  OnBoardingView.swift
//  Hob
//
//  Created by Riad on 14/11/2024.
//

import SwiftUI
import FirebaseAuth

struct OnBoardingView: View {
    @State private var animateSteps = false
    @State private var navigateToGeneral = false
    @State private var navigateToValuesAndPriorites = false
    @State private var navigateToQuiz = false
    @State private var unlockedStep = 2
    
    let repository: HobRepository
    let auth: Auth
    @StateObject private var viewModel: ViewModel

    init(auth: Auth, repository: HobRepository) {
        self.repository = repository
        self.auth = auth
        _viewModel = StateObject(wrappedValue: ViewModel(repository: repository))
    }
    
    var body: some View {
        VStack {
            AuthStepHeader(
                screenName: "Inscription",
                displayName: "Mode création",
                subtitle: "En remplissant ces questionnaires, vous trouverez des profils pépite 💎"
            )
            .padding(.bottom, 48)
            .opacity(animateSteps ? 1 : 0)
            .animation(.easeIn(duration: 1), value: animateSteps)
            
            ZStack {
                // Dessiner la ligne courbée pointillée avec animation
                DottedCurvedLineView()
                    .opacity(animateSteps ? 1 : 0)
                    .animation(.easeOut(duration: 4), value: animateSteps)
                
                
                VStack(spacing: 0) {
                    OnBoardingStep(image: "FirstStepIcon", title: "Général") {
                        self.navigateToGeneral = true
                    }
                    .offset(x: 0, y: animateSteps ? -50 : 0)
                    .opacity(animateSteps ? 1 : 0)
                    .animation(.easeOut(duration: 0.5).delay(0.5), value: animateSteps)
                    .position(x: 100, y: 100)
                    
                    OnBoardingStep(image: "SecondStepIcon", title: "Valeurs & Priorités") {
                        self.navigateToValuesAndPriorites = true
                    }
                    .offset(x: 0, y: animateSteps ? -40 : 50)
                    .opacity(animateSteps ? 1 : 0)
                    .animation(.easeOut(duration: 0.5).delay(1.0), value: animateSteps)
                    .position(x: 300, y: 50)
                    .opacity((viewModel.currentStep == .finished || viewModel.currentStep == .valuesAndPriorities || viewModel.currentStep == .quiz) ? 1 : 0.3)
                    
                    OnBoardingStep(image: "QuizIcon", title: "Quiz de personnalité") {
                        self.navigateToQuiz = true
                    }
                    .offset(x: 0, y: animateSteps ? -25 : 0)
                    .opacity(animateSteps ? 1 : 0)
                    .animation(.easeOut(duration: 0.5).delay(1.5), value: animateSteps)
                    .position(x: 150, y: 50)
                    .opacity((viewModel.currentStep == .finished || viewModel.currentStep == .quiz) ? 1 : 0.3)
                }
            }
            
            Spacer()
            
            HobButton(text: "Finaliser", width: .infinity, disabled: viewModel.currentStep != .finished) {
                viewModel.finish()
            }
            .opacity(animateSteps ? 1 : 0)
            .animation(.easeIn(duration: 1).delay(2.0), value: animateSteps)
            .padding(.bottom, 32)
        }
        .padding(.horizontal, 12)
        .background(LinearGradient(colors: [Color(hex: 0x461337), .black], startPoint: .top, endPoint: .bottom))
        .onAppear {
            DispatchQueue.main.async {
                animateSteps = true
            }
        }
        .navigationDestination(isPresented: $navigateToGeneral) {
            GeneralView(repository: repository)
        }
        .navigationDestination(isPresented: $navigateToQuiz) {
            PersonalityQuizView(repository: repository)
        }
        .navigationDestination(isPresented: $navigateToValuesAndPriorites) {
            ValuesAndPriorityView(repository: repository)
        }
        .navigationDestination(isPresented: $viewModel.isComplete) {
            MainView(auth: auth,repository: repository)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct DottedCurvedLineView: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 100, y: 110))
            
            path.addCurve(to: CGPoint(x: 300, y: 150),
                          control1: CGPoint(x: 150, y: 150),
                          control2: CGPoint(x: 250, y: 40))
            
        }
        .stroke(style: StrokeStyle(lineWidth: 2, dash: [5, 5]))
        .foregroundColor(Color("PlaceholderColor"))
        
        Path { path in
            path.move(to: CGPoint(x: 300, y: 250))
            
            path.addCurve(to: CGPoint(x: 150, y: 340),
                          control1: CGPoint(x: 250, y: 350),
                          control2: CGPoint(x: 200, y: 250))
            
        }
        .stroke(style: StrokeStyle(lineWidth: 2, dash: [5, 5]))
        .foregroundColor(Color("PlaceholderColor"))
    }
}

struct OnBoardingStep: View {
    let image: String
    let title: String
    let onClick: () -> Void
    var body: some View {
        Button {
            onClick()
        } label: {
            VStack(spacing: -12) {
                Image(image)
                    .resizable()
                    .frame(width: 100, height: 100)
                Text(title)
                    .brSonomaFont(.semiBold, 12)
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    OnBoardingView(auth: Auth.auth(), repository: HobRepository())
        .preferredColorScheme(.dark)
}
