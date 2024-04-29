//
//  Question.swift
//  CyberMonkey
//
//  Created by Jonathan Yang on 3/8/18.
//  Copyright © 2018 Jonathan Yang. All rights reserved.
//

import Foundation

class TFQuestion {
    
    let question: String
    let T: Int
    let F: Int
    let type: String
    let correctAnswer: Int
    let is_hard: Bool
    
    init(questionText: String, theme: String, correctAnswerText: Int, is_hardness:Bool) {
        question = questionText
        T = 0
        F = 1
        type = theme
        correctAnswer = correctAnswerText
        is_hard = is_hardness
    }
}

