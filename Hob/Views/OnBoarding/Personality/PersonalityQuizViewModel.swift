//
//  PersonalityQuizViewModel.swift
//  Hob
//
//  Created by Riad on 14/11/2024.
//

import SwiftUI

extension PersonalityQuizView {
    class ViewModel: ObservableObject {
        @Published var quiz: Quiz?
        @Published var categories: [Category] = []
        @Published var currentQuestionIndex: Int = 0
        @Published var selectedAnswers: [String] = []
        @Published var showResult: Bool = false
        @Published var resultCategory: Category?
        @Published var errorMessage: String?
        private var profile: Profile?
        let repository: HobRepository
        
        init(repository: HobRepository) {
            self.repository = repository
            fetchProfileData()
        }
        
        func fetchProfileData() {
            repository.getProfile { result in
                switch result {
                case .success(let profile):
                    self.profile = profile
                    if let personality = profile.personality {
                        self.getCategory(forCategoryId: personality)
                    } else {
                        self.loadQuiz()
                    }
                case .failure(let error):
                    print("Error fetching profile: \(error.localizedDescription)")
                }
            }
        }
        
        func loadQuiz() {
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
        
        func getCategory(forCategoryId id: String) {
            if let url = Bundle.main.url(forResource: "personalities", withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    let quiz = try JSONDecoder().decode(QuizData.self, from: data)
                    self.resultCategory = quiz.categories.first(where: { $0.id == id })
                    showResult = true
                } catch {
                    print("Erreur de chargement du fichier JSON : \(error)")
                }
            }
        }
        
        func updateProfile() {
            guard let profile = self.profile else {
                print("No profile data available to update.")
                return
            }
            
            var updatedData: [String: Any] = [:]
            
            if let resultCategory = self.resultCategory {
                updatedData["personality"] = resultCategory.id
            }
            
            guard !updatedData.isEmpty else {
                print("No changes detected.")
                return
            }
            
            repository.updateProfile(updatedData: updatedData) { result in
                switch result {
                case .success():
                    print("Profile updated successfully.")
                case .failure(let error):
                    print("Error updating profile: \(error.localizedDescription)")
                }
            }
        }
        
        func moveToFinish() {
            var updatedData: [String: Any] = [:]
            updatedData["onBoardingStep"] = SignUpStep.finished.rawValue
            
            repository.updateUserPreferences(updatedData: updatedData) { result in
                switch result {
                case .success():
                    print("User preferences updated successfully.")
                case .failure(let error):
                    print("Error updating user preferences: \(error.localizedDescription)")
                }
            }
        }
        
    }
}
