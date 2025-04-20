//
//  AddQuestionView.swift
//  QuizApp
//
//  Created by Chidera Anayo Mbachi on 2025-04-11.
//

import SwiftUI

struct AddQuestionView: View {
    @ObservedObject var questionBank: QuestionBank
    @Environment(\.presentationMode) var presentationMode
    @State private var questionText = ""
    @State private var correctAnswer = ""
    @State private var wrongAnswers: [String] = ["", "", ""]
    
    var question: Question?
    var questionIndex: Int?
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Question")) {
                        TextField("Enter question", text: $questionText)
                    }
                    
                    Section(header: Text("Correct Answer")) {
                        TextField("Enter correct answer", text: $correctAnswer)
                    }
                    
                    Section(header: Text("Wrong Answers")) {
                        ForEach(0..<3) { index in
                            TextField("Enter wrong answer", text: $wrongAnswers[index])
                        }
                    }
                }
                
                Button("Save") {
                    let newQuestion = Question(questionText: questionText, correctAnswer: correctAnswer, wrongAnswers: wrongAnswers)
                    if let index = questionIndex {
                        questionBank.updateQuestion(newQuestion, at: index)
                    } else {
                        questionBank.addQuestion(newQuestion)
                    }
                    presentationMode.wrappedValue.dismiss()
                }
                .disabled(questionText.isEmpty || correctAnswer.isEmpty || wrongAnswers.contains(where: { $0.isEmpty }))
                .padding()
                
                Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                }
                .padding()
            }
            .navigationTitle(question == nil ? "Add Question" : "Edit Question")
            .navigationBarTitleDisplayMode(.inline) 
        }
    }
}
