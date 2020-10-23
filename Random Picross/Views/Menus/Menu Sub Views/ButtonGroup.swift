//
//  ButtonGroup.swift
//  Random Picross
//
//  Created by Vincent Hoang on 10/22/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

import SwiftUI

struct ButtonGroup: View {
    @EnvironmentObject var gameController: GameController
    var boardSize: BoardSize
    
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            Button("Start Game", action: startGame)
                .frame(width: 250, height: 50, alignment: .center)
                .font(.title)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(12.0)
                .shadow(radius: 6.0)
        }
    }
    
    func startGame() {
        gameController.startGame(boardSize)
    }
    
    init(boardSize: BoardSize) {
        self.boardSize = boardSize
    }
}

struct ButtonGroup_Previews: PreviewProvider {
    static var previews: some View {
        ButtonGroup(boardSize: BoardSize.LARGE)
    }
}
