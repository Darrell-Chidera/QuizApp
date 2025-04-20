//
//  QuestionBank.swift
//  QuizApp
//
//  Created by Chidera Anayo Mbachi on 2025-04-11.
//

import Foundation

class QuestionBank: ObservableObject {
    @Published var questions: [Question] = []
    
    func addQuestion(_ question: Question) {
        questions.append(question)
    }
    
    func updateQuestion(_ question: Question, at index: Int) {
        questions[index] = question
    }
    
    func removeQuestion(at index: Int) {
        questions.remove(at: index)
    }
}
