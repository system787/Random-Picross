//
//  Main.swift
//  Random Picross
//
//  Created by Vincent Hoang on 10/15/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

import SwiftUI

@main
struct RandomPicross: App {
    
    @StateObject var gameController: GameController = GameController()
    
    var body: some Scene {
        WindowGroup {
            GameBoardView().environmentObject(gameController)
        }
    }
}
