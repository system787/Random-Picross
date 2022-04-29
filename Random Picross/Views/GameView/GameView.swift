//
//  GameView.swift
//  Random Picross
//
//  Created by Vincent Hoang on 10/19/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var gameController: GameController
    
    var body: some View {
        VStack(alignment: .center) {
            GameBoardView()
            ActionToggle()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
