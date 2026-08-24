//
//  RaceResult.swift
//  KeyboardWarrior
//
//  Created by Jason Mai on 8/22/26.
//

import Foundation


/* Currently modeling for a player completing a race */

struct RaceResult: Identifiable, Codable {
    let id: UUID
    let playerID: UUID
    
    let wpm: Double
    let accuracy: Double
    let errors: Int
    
    let duration: TimeInterval
    let completedAt: Date
    
    
    init(
        id: UUID = UUID(),
        playerID: UUID,
        wpm: Double,
        accuracy: Double,
        errors: Int,
        duration: TimeInterval,
        completedAt: Date = Date()
    ) {
        self.id = id
        self.playerID = playerID
        self.wpm = wpm
        self.accuracy = accuracy
        self.errors = errors
        self.duration = duration
        self.completedAt = completedAt
    }
}
