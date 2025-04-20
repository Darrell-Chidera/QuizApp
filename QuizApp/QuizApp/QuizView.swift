//
//  QuizView.swift
//  QuizApp
//
//  Created by Chidera Anayo Mbachi on 2025-04-11.
//

import SwiftUI

struct QuizView: View {
    @ObservedObject var questionBank: QuestionBank
    @State private var currentQuestionIndex = 0
    @State private var selectedAnswer: String?
    @State private var score = 0
    @State private var showResults = false
    @State private var isQuizActive = true

    var body: some View {
        if isQuizActive {
            VStack {
                Text(questionBank.questions[currentQuestionIndex].questionText)
                    .font(.title)
                    .padding()
                
                ForEach(questionBank.questions[currentQuestionIndex].allAnswers, id: \.self) { answer in
                    Button(action: {
                        selectedAnswer = answer
                    
                        if selectedAnswer == questionBank.questions[currentQuestionIndex].correctAnswer {
                            score += 1 // Increment score if the answer is correct
                        }
                    }) {
                        Text(answer)
                            .padding()
                            .background(selectedAnswer == answer ? Color.blue : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                
                HStack {
                    Button("Previous") {
                        if currentQuestionIndex > 0 {
                            currentQuestionIndex -= 1
                        }
                    }
                    .disabled(currentQuestionIndex == 0)
                    
                    Spacer()
                    
                    Button("Next") {
                        if currentQuestionIndex < questionBank.questions.count - 1 {
                            currentQuestionIndex += 1 // Move to the next question
                            selectedAnswer = nil // Reset selected answer for the next question
                        } else {
                            
                            displayResult()
                        }
                    }
                }
                .padding()
                
                ProgressView(value: Double(currentQuestionIndex + 1), total: Double(questionBank.questions.count))
                    .padding()
            }
            .padding()
            
            
            NavigationLink(destination: ResultsView(score: score, totalQuestions: questionBank.questions.count, isQuizActive: $isQuizActive), isActive: $showResults) {
                EmptyView()
            }
        } else {
           
            Button("Start Quiz Again") {
                resetQuiz()
            }
            .padding()
        }
    }
    
    private func displayResult() {
        showResults = true
    }
    
    private func resetQuiz() {
        currentQuestionIndex = 0
        selectedAnswer = nil
        score = 0
        isQuizActive = true
        showResults = false 
    }
}
