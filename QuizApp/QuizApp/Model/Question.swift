//
//  Question.swift
//  QuizApp
//
//  Created by yumi on 2020/06/02.
//  Copyright © 2020 Yumi Takahashi. All rights reserved.
//

import Foundation

// クイズの構成を記載
struct Question {
    
    let text: String
    var answers: [String]
    let rightAnswer: String
    let label: Int
    
    init(q: String, a: [String], correctAnswer: String, l: Int) {
        text = q
        answers = a
        rightAnswer = correctAnswer
        label = l
    }
}
