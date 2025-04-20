//
//  QuestionBankDelegate.swift
//  QuizApp
//
//  Created by Chidera Anayo Mbachi on 2025-04-11.
//

import Foundation

protocol QuestionBankDelegate: AnyObject {
    func didAddQuestion(_ question: Question)
    func didUpdateQuestion(_ question: Question, at index: Int)
}
