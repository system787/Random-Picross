//
//  Board.swift
//  Random Picross
//
//  Created by Vincent Hoang on 10/15/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

import Foundation

enum BoardSize: Int {
    case SMALL = 5
    case MEDIUM = 10
    case LARGE = 15
}

enum TileState: Int {
    case EMPTY = 0
    case TRAP = 1
    case CLEARED = 2
    case FLAGGED = 3
}

class Board {
    private var mBoardSize: Int
    private var mGameBoard: [[Int]]
    
    init(_ boardSize: BoardSize) {
        self.mBoardSize = boardSize.rawValue
        self.mGameBoard = [[Int]]()
        mGameBoard = generateBoard()
    }
    
    private func generateRow() -> [Int] {
        var row = [Int]()
        
        while row.count < mBoardSize {
            let randomLength = Int.random(in:0...mBoardSize-row.count)
            
            if randomLength > 0 {
                for _ in 1...randomLength {
                    row.append(1)
                }
            }
            
            if row.count < mBoardSize {
                row.append(0)
            }
        }
        
        return row
    }
    
    private func generateBoard() -> [[Int]] {
        var board = [[Int]]()
        
        for _ in 0..<mBoardSize {
            board.append(generateRow())
        }
        
        return board
    }
    
    func getBoard() -> [[Int]] {
        return mGameBoard
    }
}
