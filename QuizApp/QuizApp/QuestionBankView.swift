//
//  QuestionBankView.swift
//  QuizApp
//
//  Created by Chidera Anayo Mbachi on 2025-04-11.
//

import SwiftUI

struct QuestionBankView: View {
    @ObservedObject var questionBank: QuestionBank
    @State private var showingAddQuestion = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(questionBank.questions.indices, id: \.self) { index in
                    NavigationLink(destination: AddQuestionView(questionBank: questionBank, question: questionBank.questions[index], questionIndex: index)) {
                        Text(questionBank.questions[index].questionText)
                    }
                }
                .onDelete(perform: deleteQuestion)
            }
            .navigationTitle("Question Bank")
            .navigationBarItems(trailing: Button(action: {
                showingAddQuestion = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showingAddQuestion) {
                AddQuestionView(questionBank: questionBank)
            }
        }
    }
    
    private func deleteQuestion(at offsets: IndexSet) {
        for index in offsets {
            questionBank.removeQuestion(at: index) 
        }
    }
}
