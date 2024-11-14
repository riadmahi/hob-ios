//
//  PersonalityQuizViewmodel.swift
//  Hob
//
//  Created by Riad on 14/11/2024.
//

import SwiftUI

class PersonalityQuizViewModel: ObservableObject {
    @Published var quiz: Quiz?
    @Published var categories: [Category] = []
    @Published var currentQuestionIndex: Int = 0
    @Published var selectedAnswers: [String] = []
    @Published var showResult: Bool = false
    @Published var resultCategory: Category?
    @Published var errorMessage: String?
    init() {
        loadQuiz()
    }
    
    func loadQuiz() {
        // Assurez-vous que le nom du fichier et l'extension sont corrects
        if let url = Bundle.main.url(forResource: "personalities", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(QuizData.self, from: data)
                DispatchQueue.main.async {
                    self.quiz = decodedData.quiz
                    self.categories = decodedData.categories
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = "Erreur de chargement du quiz. Veuillez réessayer."
                }
                print("Erreur de décodage JSON: \(error)")
            }
        } else {
            DispatchQueue.main.async {
                self.errorMessage = "Fichier de quiz non trouvé."
            }
            print("Fichier personalities.json non trouvé dans le bundle.")
        }
    }
    
    func selectAnswer(category: String) {
        selectedAnswers.append(category)
        if currentQuestionIndex + 1 < quiz?.questions.count ?? 0 {
            currentQuestionIndex += 1
        } else {
            calculateResult()
            showResult = true
        }
    }
    
    func calculateResult() {
        guard !selectedAnswers.isEmpty else { return }
        let categoryCount = selectedAnswers.reduce(into: [:]) { counts, category in
            counts[category, default: 0] += 1
        }
        if let topCategoryId = categoryCount.max(by: { $0.value < $1.value })?.key {
            resultCategory = categories.first(where: { $0.id == topCategoryId })
        }
    }
    
    
    func resetQuiz() {
        currentQuestionIndex = 0
        selectedAnswers = []
        showResult = false
        resultCategory = nil
    }
}
