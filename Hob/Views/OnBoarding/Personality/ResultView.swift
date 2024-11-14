//
//  ResultView.swift
//  Hob
//
//  Created by Riad on 14/11/2024.
//


import SwiftUI

struct PersonalityResultView: View {
    let category: Category
    let onRestart: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("🎉 Félicitations !")
                .font(.largeTitle)
                .padding(.top, 40)

            Text(category.name)
                .font(.title)
                .fontWeight(.bold)

            Text(category.description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()

            Spacer()

            Button(action: {
                onRestart()
            }) {
                Text("Recommencer le Quiz")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.bottom, 40)
        }
        .padding()
    }
}
