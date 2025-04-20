//
//  Question.swift
//  QuizApp
//
//  Created by Chidera Anayo Mbachi on 2025-04-11.
//

import Foundation

struct Question: Identifiable {
    let id = UUID()
    var questionText: String
    var correctAnswer: String
    var wrongAnswers: [String]
    
    var allAnswers: [String] {
        return wrongAnswers + [correctAnswer]
    }
}
