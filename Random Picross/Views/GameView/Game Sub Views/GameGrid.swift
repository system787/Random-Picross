//
//  GameGrid.swift
//  Random Picross
//
//  Created by Vincent Hoang on 10/16/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

import SwiftUI

struct GameGrid: View {
    @EnvironmentObject var gameController: GameController
    
    var body: some View {
        if gameController.mBoardSize == BoardSize.LARGE {
            VStack(spacing: 0.0) {
                ForEach (0..<15) { y in
                    HStack(spacing: 0.0) {
                        ForEach (0..<15) { x in
                            GameTile(x: x, y: y, function: self.buttonPressed)
                        }
                    }
                }
            }.frame(alignment: .topLeading)
            .border(Color.black, width: 0.5)
        }
    }
    
    func buttonPressed(x: Int, y: Int) -> Void {
        gameController.updateUserBoard(x: x, y: y)
        tileAction(x: x, y: y)
    }
    
    func tileAction(x: Int, y: Int) {
        print("Button tapped at (\(x),\(y))")
    }
}

struct GameGrid_Previews: PreviewProvider {
    static var previews: some View {
        GameGrid()
    }
}
