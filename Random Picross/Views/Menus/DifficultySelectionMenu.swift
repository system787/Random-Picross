//
//  DifficultySelectionMenu.swift
//  Random Picross
//
//  Created by Vincent Hoang on 10/22/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

import SwiftUI

struct DifficultySelectionMenu: View {
    var body: some View {
        
        NavigationView {
            
            ZStack {
                DifficultySelectionCarousel(itemHeight: 400, views: [
                    AnyView(VStack {
                                Text("Small - 5x5").font(.title2)
                                Spacer().frame(height: 50)
                                ButtonGroup(boardSize: BoardSize.SMALL) }),
                    AnyView(VStack {
                                Text("Medium - 10x10").font(.title2)
                                Spacer().frame(height: 50)
                                ButtonGroup(boardSize: BoardSize.MEDIUM) }),
                    AnyView(VStack {
                                Text("Large - 15x15").font(.title2)
                                Spacer().frame(height: 50)
                                ButtonGroup(boardSize: BoardSize.LARGE) })
                ])
            }.navigationTitle("New Game")
        }
    }
}

struct DifficultySelectionMenu_Previews: PreviewProvider {
    static var previews: some View {
        DifficultySelectionMenu()
    }
}
