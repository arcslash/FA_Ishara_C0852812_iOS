//
//  Player.swift
//  FA_Ishara_C0852812_iOS
//
//  Created by Ishara Abeykoon on 2022-05-30.
//

import Foundation

class Player{
    let playerId: Int
    let playerName: String
    var playerScore: Int
    
    init(playerId: Int, playerName: String, playerScore: Int){
        self.playerId = playerId
        self.playerName = playerName
        self.playerScore = playerScore
    }
}
