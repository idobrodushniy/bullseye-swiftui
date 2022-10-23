//
//  Game.swift
//  Bullseye
//
//  Created by Ilia on 17.10.2022.
//

import Foundation

struct LeaderboardEntry{
    let score: Int
    let date: Date
}

struct Game {
    var target: Int = generateRandomTarget()
    var score: Int = 0
    var round: Int = 1
    var leaderboardEntries: [LeaderboardEntry] = []
    
    init(loadTestData: Bool = false){
        if loadTestData{
            addToLeaderboard(points: 100)
            addToLeaderboard(points: 80)
            addToLeaderboard(points: 200)
            addToLeaderboard(points: 50)
        }
    }
    
    static func generateRandomTarget() -> Int{
        return Int.random(in: 1...100)
    }
    
    func points(sliderValue: Int) -> Int {
        
        let scoredPoints =  100 - abs(sliderValue - target)
        
        if scoredPoints == 100{
            return scoredPoints + 100
        }
        if scoredPoints >= 98 {
            return scoredPoints + 50
        }
        
        return scoredPoints
    }
    
    mutating private func addToLeaderboard(points: Int){
        leaderboardEntries.append(LeaderboardEntry(score:points, date: Date()))
        leaderboardEntries.sort {$0.score > $1.score}
    }
    
    mutating func startNewRound(points: Int){
        score += points
        round += 1
        target = Game.generateRandomTarget()
        addToLeaderboard(points: points)
    }
    
    mutating func restart(){
        self = Game()
    }
}
