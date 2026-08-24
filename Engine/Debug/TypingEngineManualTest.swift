//
//  TypingEngineManualTest.swift
//  KeyboardWarrior
//
//  Created by Jason Mai on 8/24/26.
//

import Foundation

func runTypeEngineManualTest() {
    var engine = TypingEngine(targetText: "cat")
    
    print("---START---")
    print("Target: ", engine.targetText)
    print("Typed: ", engine.typedText)
    print("Progress: ", engine.progress)
    print("Errors: ", engine.errorCount)
    print("Accuracy: ", engine.accuracy)
    print("Complete: ", engine.isComplete)
    
    engine.updateInput("c")
    
    print("---AFTER TYPING 'c'---")
    print("Target: ", engine.targetText)
    print("Typed: ", engine.typedText)
    print("Progress: ", engine.progress)
    print("Errors: ", engine.errorCount)
    print("Accuracy: ", engine.accuracy)
    print("Complete: ", engine.isComplete)
    
    engine.updateInput("co")
    print("---AFTER TYPING 'co' WRONG CHARACTER---")
    print("Target: ", engine.targetText)
    print("Typed: ", engine.typedText)
    print("Progress: ", engine.progress)
    print("Errors: ", engine.errorCount)
    print("Accuracy: ", engine.accuracy)
    print("Complete: ", engine.isComplete)
    
    engine.updateInput("c")
    print("---BACKSPACE---")
    print("Target: ", engine.targetText)
    print("Typed: ", engine.typedText)
    print("Progress: ", engine.progress)
    print("Errors: ", engine.errorCount)
    print("Accuracy: ", engine.accuracy)
    print("Complete: ", engine.isComplete)
    
    
    engine.updateInput("ca")
    engine.updateInput("cat")
    print("---AFTER TYPING 'cat'---")
    print("Target: ", engine.targetText)
    print("Typed: ", engine.typedText)
    print("Progress: ", engine.progress)
    print("Errors: ", engine.errorCount)
    print("Accuracy: ", engine.accuracy)
    print("Complete: ", engine.isComplete)
}
