//
//  ResultsView.swift
//  QuizApp
//
//  Created by Chidera Anayo Mbachi on 2025-04-11.
//

import SwiftUI

struct ResultsView: View {
    var score: Int
    var totalQuestions: Int
    @Binding var isQuizActive: Bool
    
    var body: some View {
        VStack {
            Text("Quiz Completed!")
                .font(.largeTitle)
                .padding()
            
            Text("Your score: \(score) out of \(totalQuestions)")
                .font(.title)
                .padding()
            
            Button("Restart Quiz") {
                isQuizActive = false
            }
            .padding()
        }
        .navigationTitle("Results")
    }
}
