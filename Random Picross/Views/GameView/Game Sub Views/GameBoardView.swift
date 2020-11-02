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
        VStack(alignment: .leading) {
            // top hints panel
            HStack(spacing: 0.0) {
                Spacer().frame(width: 3.0)
                
                Spacer()
                    .frame(width: 75, height: 75, alignment: .center)
                
                ForEach (0..<5, id: \.self) { i in
                    HintFrame(gameController.getColumnCount(i), Color.blue, gameController.mBoardSize)
                }
                
                if gameController.mBoardSize == BoardSize.MEDIUM {
                    ForEach (5..<10, id: \.self) { i in
                        HintFrame(gameController.getColumnCount(i), Color.gray, gameController.mBoardSize)
                    }
                }
                
                if gameController.mBoardSize == BoardSize.LARGE {
                    ForEach (5..<10, id: \.self) { i in
                        HintFrame(gameController.getColumnCount(i), Color.gray, gameController.mBoardSize)
                    }
                    
                    ForEach (10..<15, id: \.self) { i in
                        HintFrame(gameController.getColumnCount(i), Color.blue, gameController.mBoardSize)
                    }
                }
                
                Spacer().frame(width: 1.0)
            }.frame(alignment: .topLeading)
            
            Spacer().frame(height: 3.0)
            
            //
            HStack() {
                // left hints panel
                VStack(spacing: 0.0) {
                    ForEach (0..<5, id: \.self) { i in
                        RowHintFrame(gameController.getRowCount(i), Color.blue, gameController.mBoardSize)
                    }
                    
                    if gameController.mBoardSize == BoardSize.MEDIUM {
                        ForEach (5..<10, id: \.self) { i in
                            RowHintFrame(gameController.getRowCount(i), Color.gray, gameController.mBoardSize)
                        }
                    }
                    
                    if gameController.mBoardSize == BoardSize.LARGE {
                        ForEach (5..<10, id: \.self) { i in
                            RowHintFrame(gameController.getRowCount(i), Color.gray, gameController.mBoardSize)
                        }
                        
                        ForEach (10..<15, id: \.self) { i in
                            RowHintFrame(gameController.getRowCount(i), Color.blue, gameController.mBoardSize)
                        }
                    }
                }.frame(alignment: .topLeading)
                
                Spacer().frame(width: 3.0)
                
                GameGrid()
            }
            
        }
    }

}

struct GameBoardView_Previews: PreviewProvider {
    static var previews: some View {
        GameBoardView().environmentObject(GameController())
    }
}
