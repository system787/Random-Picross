//
//  GameBoard.swift
//  Random Picross
//
//  Created by Vincent Hoang on 10/15/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

import SwiftUI

struct GameBoardView: View {
    @EnvironmentObject var gameController: GameController
    
    var body: some View {
        HStack(spacing: 1.0) {
            Spacer()
                .frame(width: 50.0)
            ForEach (0..<gameController.mGameBoard.count, id: \.self) { i in
                HintFrame(gameController.getColumnCount(i))
            }
        }.padding(.trailing)
    }

}

struct GameBoardView_Previews: PreviewProvider {
    static var previews: some View {
        GameBoardView().environmentObject(GameController())
    }
}
