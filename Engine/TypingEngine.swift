//
//  TypingEngine.swift
//  KeyboardWarrior
//
//  Created by Jason Mai on 8/24/26.
//

import Foundation

struct TypingEngine {
    
    let targetText: String          // the String we will be racing against
    
    private(set) var typedText: String = "" // Our users input
    private(set) var totalAttempts: Int = 0
    private(set) var errorCount: Int = 0
    
    // The number of correct characters in the users input.
    //      - it breaks the moment the user inputs a wrong character
    var correctCharacterCount: Int {
        let targetCharacters = Array(targetText)
        let typedCharacters = Array(typedText)
        var correctCount = 0
        
        for (typedCharacter, targetCharacter) in zip(typedCharacters, targetCharacters) {
            guard typedCharacter == targetCharacter else {
                break
            }
            correctCount += 1
        }
        return correctCount
    }
    
    
    // progress bar
    var progress: Double {
        guard !targetText.isEmpty else {
            return 0
        }
        return Double(correctCharacterCount) / Double(targetText.count)
    }
    
    // Completion
    var isComplete: Bool {
        !targetText.isEmpty && typedText == targetText
    }
    
    // user input
    mutating func updateInput(_ newInput: String){
        let targetCharacters = Array(targetText)
        
        let newCharacters = Array(newInput.prefix(targetCharacters.count))
        let oldCharacters = Array(typedText)
        
        if newCharacters.count > oldCharacters.count {
            for index in oldCharacters.count..<newCharacters.count {
                totalAttempts += 1
                if newCharacters[index] != targetCharacters[index] {
                    errorCount += 1
                }
            }
        }
        typedText = String(newCharacters)
    }
    
    // accuracy: the number of correct attempts / total attempts * 100
    var accuracy: Double {
        guard totalAttempts > 0 else {
            return 100
        }
        let correctAttempts = totalAttempts - errorCount
        return Double(correctAttempts) / Double(totalAttempts) * 100
    }
    
    
    // Words per Minute calculation
    func wordsPerMinute(
        elapsedTime: TimeInterval
    ) -> Double {

        guard elapsedTime > 0 else {
            return 0
        }

        let standardWords =
            Double(correctCharacterCount) / 5.0

        let elapsedMinutes =
            elapsedTime / 60.0

        return standardWords / elapsedMinutes
    }
    
    
}

