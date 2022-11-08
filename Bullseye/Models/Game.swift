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
        100 - abs(target - sliderValue)
        
        // Refactoring
        
//        if difference < 0 {
//            difference *= -1
//        }

        /* Initial
        if sliderValue > target {
            difference = sliderValue - target
        } else if sliderValue < target {
            difference = target - sliderValue
        } else {
            difference = 0
        }
         */
    }

    mutating func startNewRound(points: Int) {
        score += points
        round += 1
    }
}
