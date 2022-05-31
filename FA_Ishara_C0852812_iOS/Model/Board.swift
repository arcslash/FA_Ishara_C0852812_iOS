//
//  Board.swift
//  FA_Ishara_C0852812_iOS
//
//  Created by Ishara Abeykoon on 2022-05-30.
//

import UIKit

class Board{
    var board: [UIButton] = [UIButton]()
    var boardStates: [Int]
    init(boardStates: [Int]){
        self.boardStates = boardStates
    }
    
    func add(square: UIButton){
        board.append(square)
    }
}

