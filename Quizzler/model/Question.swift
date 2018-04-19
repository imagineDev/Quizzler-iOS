//
//  Question.swift
//  Quizzler
//
//  Created by Sahil Sharma on 17/04/18.
//  Copyright © 2018 Sahil Sharma. All rights reserved.
//

import Foundation

class Question{
    
    var questionText: String = ""
    var correctAnswer: Bool = false

    init(questionText: String, correctAnswer: Bool) {
        self.questionText = questionText
        self.correctAnswer = correctAnswer
    }
    
}
