//
//  Game.swift
//  Bullseye
//
//  Created by Rich Polanco on 10/19/22.
//

import Foundation

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    var leaderboardEntries: [LeaderboardEntry] = []

    init(loadTestData: Bool = false) {
        if loadTestData {
            leaderboardEntries.append(LeaderboardEntry(score: 100, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 80, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 25, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 77, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 99, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 58, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 23, date: Date()))
        }
    }
    
    func points(sliderValue: Int) -> Int {
        var totalPoints = 100 - abs(target - sliderValue)
        if totalPoints == 100 {
            totalPoints += 100
        } else if totalPoints >= 98 {
            totalPoints += 50
        } else {
            totalPoints += 0
        }
        return totalPoints
    }
    
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: 1...100)
        addToLeaderboard(points: score)
    }

    mutating func addToLeaderboard (points: Int) {
        leaderboardEntries.append(LeaderboardEntry(score: points, date: Date()))
        leaderboardEntries.sort { $0.score > $1.score }
    }
    
    mutating func restart() {
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
}

struct LeaderboardEntry {
    let score: Int
    let date: Date
}
