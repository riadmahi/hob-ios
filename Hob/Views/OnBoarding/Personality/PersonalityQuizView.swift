//
//  PersonalityQuiz.swift
//  Hob
//
//  Created by Riad on 14/11/2024.
//

import SwiftUI

struct PersonalityQuizView: View {
    @StateObject var viewModel: ViewModel
    @Environment(\.dismiss) private var dismiss

    init(repository: HobRepository) {
        _viewModel = StateObject(wrappedValue: ViewModel(repository: repository))
    }
    var body: some View {
        VStack {
            if let quiz = viewModel.quiz {
                if viewModel.showResult, let category = viewModel.resultCategory {
                    PersonalityResultView(category: category, onRestart: {
                        viewModel.resetQuiz()
                    }, onSave: {
                        viewModel.updateProfile()
                        viewModel.moveToFinish()
                        dismiss()
                    })
                    .navigationBarBackButtonHidden(true)
                } else {
                    VStack {
                        Image("QuizIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .accessibilityHidden(true)
                        
                        AuthStepHeader(
                            screenName: "Quiz",
                            displayName: "Découvre ta personnalité"
                        )
                        
                        ProgressView(value: progressFraction())
                            .progressViewStyle(LinearProgressViewStyle(tint: .white))
                            .frame(width: 180)
                            .padding(.vertical, 12)
                            .animation(.spring(duration: 0.5), value: progressFraction())
                        if viewModel.currentQuestionIndex < quiz.questions.count {
                            let currentQuestion = quiz.questions[viewModel.currentQuestionIndex]
                            QuestionView(question: currentQuestion, onSelectAnswer: { category in
                                withAnimation {
                                    viewModel.selectAnswer(category: category)
                                }
                            })
                            .transition(.slide)
                        }
                    }
                    .navigationBarHidden(true)
                }
            } else {
                ProgressView("Chargement du Quiz...")
            }
        }
        .animation(.default, value: viewModel.currentQuestionIndex)
        
    }
    
    func progressFraction() -> Double {
        guard let quiz = viewModel.quiz else { return 0 }
        return Double(viewModel.currentQuestionIndex) / Double(quiz.questions.count)
    }
}

#Preview {
    PersonalityQuizView(repository: HobRepository())
        .preferredColorScheme(.dark)
}
