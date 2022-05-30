//
//  Board.swift
//  FA_Ishara_C0852812_iOS
//
//  Created by Ishara Abeykoon on 2022-05-30.
//

import Foundation

class Board{
    var a1: Int
    var a2: Int
    var a3: Int
    var b1: Int
    var b2: Int
    var b3: Int
    var c1: Int
    var c2: Int
    var c3: Int
    var currentTurnOwnPlayerId: Int
    
    init(a1: Int, a2: Int, a3: Int, b1: Int, b2: Int, b3: Int, c1: Int, c2: Int, c3: Int, currentTurnOwnPlayerId: Int){
        self.a1 = a1
        self.a2 = a2
        self.a3 = a3
        self.b1 = b1
        self.b2 = b2
        self.b3 = b3
        self.c1 = c1
        self.c2 = c2
        self.c3 = c3
        self.currentTurnOwnPlayerId = currentTurnOwnPlayerId
    }
    
    func updateSquare(squareAddress: String, squareValue: Int){
        if(squareAddress == "a1"){
            a1 = squareValue
        }
        if(squareAddress == "a2"){
            a2 = squareValue
        }
        if(squareAddress == "a3"){
            a3 = squareValue
        }
        if(squareAddress == "b1"){
            b1 = squareValue
        }
        if(squareAddress == "b2"){
            b2 = squareValue
        }
        if(squareAddress == "b3"){
            b3 = squareValue
        }
        if(squareAddress == "c1"){
            c1 = squareValue
        }
        if(squareAddress == "c2"){
            c2 = squareValue
        }
        if(squareAddress == "c3"){
            c3 = squareValue
        }
    }
    func viewCurrentBoard() -> [Int]{
        return [a1, a2, a3, b1, b2, b3, c1, c2, c3]
    }
    func viewCurrentBoardMap() -> [String]{
        return ["a1", "a2", "a3", "b1", "b2", "b3", "c1", "c2", "c3"]
    }
}

