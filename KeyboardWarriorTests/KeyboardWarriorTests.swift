//
//  KeyboardWarriorTests.swift
//  KeyboardWarriorTests
//
//  Created by Jason Mai on 8/22/26.
//

import Testing
@testable import KeyboardWarrior

struct KeyboardWarriorTests {

    @Test
    func engineStartsWithCorrectInitialState() {
        let engine = TypingEngine(targetText: "cat")
        #expect(engine.typedText.isEmpty)
        #expect(engine.totalAttempts == 0)
        #expect(engine.errorCount == 0)
        #expect(engine.correctCharacterCount == 0)
        #expect(engine.progress == 0)
        #expect(engine.accuracy == 100)
        #expect(engine.isComplete == false)
    }
    
    
    @Test
    func correctInputAdvancesProgress() {
        var engine = TypingEngine(targetText: "cat")
        engine.updateInput("c")
        engine.updateInput("ca")
        engine.updateInput("cat")
        #expect(engine.progress == 1.0)
        #expect(engine.isComplete == true)
    }
    
    @Test
    func incorrectCharacterDoesNotAdvanceProgress() {
        var engine = TypingEngine(targetText: "cat")

        engine.updateInput("c")
        engine.updateInput("cx")

        #expect(engine.typedText == "cx")

        #expect(engine.correctCharacterCount == 1)

        #expect(engine.totalAttempts == 2)
        #expect(engine.errorCount == 1)

        #expect(
            abs(engine.progress - (1.0 / 3.0)) < 0.0001
        )
    }
    
    @Test
    func correctingMistakeDoesNotEraseErrorHistory() {
        var engine = TypingEngine(targetText: "cat")

        engine.updateInput("c")
        engine.updateInput("cx")

        #expect(engine.errorCount == 1)

        engine.updateInput("c")

        #expect(engine.typedText == "c")
        #expect(engine.errorCount == 1)
        #expect(engine.totalAttempts == 2)

        engine.updateInput("ca")

        #expect(engine.errorCount == 1)
        #expect(engine.totalAttempts == 3)

        #expect(
            abs(engine.accuracy - 66.6667) < 0.001
        )
    }
    
    
    @Test
    func calculatesWordsPerMinute() {
        let text = "abcdefghijklmnopqrstuvwxy"

        var engine = TypingEngine(targetText: text)

        engine.updateInput(text)

        let wpm = engine.wordsPerMinute(
            elapsedTime: 30
        )

        #expect(wpm == 10)
    }

}
