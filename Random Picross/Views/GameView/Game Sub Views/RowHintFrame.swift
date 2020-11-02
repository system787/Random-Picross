//
//  RowHintFrame.swift
//  Random Picross
//
//  Created by Vincent Hoang on 10/16/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

import SwiftUI

struct RowHintFrame: View {
    let hintArray: [Int]
    let color: Color
    let boardSize: BoardSize
    
    var body: some View {
        if boardSize == BoardSize.LARGE {
            let large = HStack(spacing: 3.0) {
                ForEach(hintArray, id: \.self) { hint in
                    HintText(String(hint), Font.caption2)
                }
            }
            .frame(width: 75, height: 18, alignment: .center)
            .background(color)
            .border(Color.white, width: 0.4)
            .cornerRadius(4.0)
            
            large
        } else if boardSize == BoardSize.MEDIUM {
            let medium = HStack(spacing: 5.0) {
                ForEach(hintArray, id: \.self) { hint in
                    HintText(String(hint), Font.body)
                }
            }
            .frame(width: 110, height: 27, alignment: .center)
            .background(color)
            .border(Color.white, width: 0.4)
            .cornerRadius(4.0)
            
            medium
        } else {
            let small = HStack(spacing: 7.0) {
                ForEach(hintArray, id: \.self) { hint in
                    HintText(String(hint), Font.title2)
                }
            }
            .frame(width: 110, height: 36, alignment: .center)
            .background(color)
            .border(Color.white, width: 0.4)
            .cornerRadius(4.0)
            
            small
        }

    }
    
    init(_ hintArray: [Int], _ color: Color, _ boardSize: BoardSize) {
        self.hintArray = hintArray
        self.color = color
        self.boardSize = boardSize
    }
}

struct RowHintFrame_Previews: PreviewProvider {
    static var previews: some View {
        RowHintFrame([6, 5, 4], Color.red, BoardSize.LARGE)
        RowHintFrame([6, 5, 4], Color.red, BoardSize.MEDIUM)
        RowHintFrame([6, 5, 4], Color.red, BoardSize.SMALL)
    }
}
