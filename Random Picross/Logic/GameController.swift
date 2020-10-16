//
//  GameController.swift
//  Random Picross
//
//  Created by Vincent Hoang on 10/15/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

import Foundation

enum ActionState {
    case CHECK
    case FLAG
}

enum ActionResult {
    case FLAG_CORRECT
    case FLAG_INCORRECT
    case CHECK_CORRECT
    case CHECK_INCORRECT
}

class GameController: ObservableObject {
    var mGameBoard: [[Int]] = [[]]
    
    init() {
        startGame(BoardSize.LARGE)
    }
    
    // MARK: - Private Functions
    private func getColumn(_ targetColumn: Int) -> [Int] {
        var column = [Int]()
        
        for i in 0..<mGameBoard.count {
            column.append(mGameBoard[i][targetColumn])
        }
        
        return column
    }
    
    private func getRowCount(_ inputArray: [Int]) -> [Int] {
        var rowCounts = [Int]()
        var count = 0
        
        for i in inputArray {
            if i == 1 {
                count += 1
            } else if i == 0 && count > 0 {
                rowCounts.append(count)
                count = 0
            }
        }
        
        if count > 0 {
            rowCounts.append(count)
        }
        
        return rowCounts
    }
    
    // MARK: - Public Functions
    func startGame(_ boardSize: BoardSize) {
        let board = Board(boardSize)
        mGameBoard = board.getBoard()
        
        print("Game started with board size \(boardSize.rawValue)")
    }
    
    func getColumnCount(_ column: Int) -> [Int] {
        return getRowCount(getColumn(column))
    }
    
    func getRowCount(_ row: Int) -> [Int] {
        return getRowCount(mGameBoard[row])
    }
    
    func updateTile(_ tile: [Int], _ tileState: TileState) {
        mGameBoard[tile[0]][tile[1]] = tileState.rawValue
    }
    
    func checkTile(_ tile: [Int], _ action: ActionState) -> ActionResult {
        switch action {
        case ActionState.CHECK:
            if mGameBoard[tile[0]][tile[1]] == 0 {
                updateTile(tile, TileState.FLAGGED)
                return ActionResult.CHECK_INCORRECT
            } else {
                updateTile(tile, TileState.CLEARED)
                return ActionResult.CHECK_CORRECT
            }
        case ActionState.FLAG:
            if mGameBoard[tile[0]][tile[1]] == 0 {
                updateTile(tile, TileState.FLAGGED)
                return ActionResult.FLAG_CORRECT
            } else {
                updateTile(tile, TileState.CLEARED)
                return ActionResult.FLAG_INCORRECT
            }
        }
    }
}
