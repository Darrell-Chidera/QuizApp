//
//  ContentView.swift
//  QuizApp
//
//  Created by Chidera Anayo Mbachi on 2025-04-11.
//

import SwiftUI

struct MainView: View {
    @StateObject private var questionBank = QuestionBank()
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: QuestionBankView(questionBank: questionBank)) {
                    Text("Build the Question Bank")
                }
                .padding()
                
                NavigationLink(destination: QuizView(questionBank: questionBank)) {
                    Text("Start the Quiz")
                }
                .padding()
            }
            .navigationTitle("Quiz App")
        }
    }
}
