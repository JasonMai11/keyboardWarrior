//
//  Player.swift
//  KeyboardWarrior
//
//  Created by Jason Mai on 8/22/26.
//

import Foundation


/* Instantiate who a player is, not all of their statistics
    
    THREE PROTOCOLS (Identifiable, Codable, Hashable)
        1. Identifiable: useful with SwiftUI since it needs a unique Identifier
        2. Codable: makes persistence/networking easier
                Player -> JSON -> CloudKit / Server / etc.
        3. Hashable: useful when comparing/storing players in collections
 */

public struct Player: Identifiable, Codable, Hashable {
    public let id: UUID
    var username: String
    
    init (
        id: UUID = UUID(),
        username: String
    ) {
        self.id = id
        self.username = username
    }
    
}
