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

        //      Ray's answer
        //        let difference = abs(target - sliderValue)
        //        let bonus: Int
        //
        //        if difference == 0 {
        //            bonus = 100
        //        } else if difference <= 2 {
        //            bonus = 50
        //        } else {
        //            bonus = 0
        //        }
        //
        //        return 100 - difference + bonus
    }

    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: 1...100)
    }
}
