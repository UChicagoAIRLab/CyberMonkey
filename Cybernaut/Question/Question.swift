//
//  Question.swift
//  CyberMonkey
//
//  Created by Jonathan Yang on 3/8/18.
//  Copyright © 2018 Jonathan Yang. All rights reserved.
//

import Foundation

class Question {
    
    let question: String
    let optionA: String
    let optionB: String
    let optionC: String
    let optionD: String
    let correctAnswer: Int
    let is_hard: Bool
    
    init(questionText: String, choiceA: String, choiceB: String, choiceC: String, choiceD: String, correctAnswerText: Int, is_hardBool: Bool) {
        question = questionText
        optionA = choiceA
        optionB = choiceB
        optionC = choiceC
        optionD = choiceD
        correctAnswer = correctAnswerText
        is_hard = is_hardBool
    }
}
