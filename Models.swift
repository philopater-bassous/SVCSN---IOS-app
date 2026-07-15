//
//  Models.swift
//  SVCSN
//
//  Created by Philopater Bassous on 2/18/25.
//

import Foundation

// Represents a sport
struct Sport: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let roster: [Player]
    let gameSchedule: [Game]
}

// Represents a player in a sport
struct Player: Identifiable {
    let id = UUID()
    let name: String
    let position: String
    let stats: [GameStats]
}

// Represents a scheduled game
struct Game: Identifiable {
    let id = UUID()
    let opponent: String
    let date: String
}

// Represents stats for a player in a specific game
struct GameStats: Identifiable {
    let id = UUID()
    let game: Game
    let points: Int
    let assists: Int
    let rebounds: Int
}
