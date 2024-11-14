//
//  QuestionView.swift
//  Hob
//
//  Created by Riad on 14/11/2024.
//


import SwiftUI

struct QuestionView: View {
    let question: Question
    let onSelectAnswer: (String) -> Void
    @State var selectedAnswerId: String?
    @State private var isSelecting: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text(question.text)
                .brSonomaFont(.semiBold, 18)
                .multilineTextAlignment(.center)
                .accessibilityLabel("Question: \(question.text)")
            
            ForEach(question.answers) { answer in
                RadioCard(label: answer.text, selected: isSelecting && answer.id == selectedAnswerId) {
                    self.selectAnswer(answer: answer)
                    
                }
                .accessibilityLabel(answer.text)
            }
            
            Spacer()
        }
        .padding()
    }
    
    private func selectAnswer(answer: Answer) {
        guard !isSelecting else { return }
        
        self.selectedAnswerId = answer.id
        self.isSelecting = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            onSelectAnswer(answer.category)
            self.selectedAnswerId = nil
            self.isSelecting = false
        }
    }
}
