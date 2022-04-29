//
//  GameTile.swift
//  Random Picross
//
//  Created by Vincent Hoang on 10/15/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

import SwiftUI

struct GameTile: View {
    @EnvironmentObject var gameController: GameController
    
    let x: Int
    let y: Int
    var function: (Int, Int) -> Void
    
    var body: some View {
        let button = Button(action: { function(x, y) } ) {
            if gameController.mUserBoard[x][y] == 0 {
                Image("tile_unchecked_18x18")
            } else if gameController.mUserBoard[x][y] == 1 {
                Image("tile_checked_18x18")
            } else {
                Image("tile_x_18x18")
            }
        }
        .border(Color.black, width: 0.2)
        
        if gameController.mBoardSize == BoardSize.LARGE {
            button.frame(width: 18, height: 18, alignment: .topLeading)
        } else if gameController.mBoardSize == BoardSize.MEDIUM {
            button.frame(width: 27, height: 27, alignment: .topLeading)
        } else {
            button.frame(width: 36, height: 36, alignment: .topLeading)
        }
    }
    
    init(x: Int, y: Int, function: @escaping (Int, Int) -> Void) {
        self.x = x
        self.y = y
        self.function = function
    }
}

struct GameTile_Previews: PreviewProvider {
    static var previews: some View {
        GameTile(x: 0, y: 1, function: {x, y in })
    }
}
