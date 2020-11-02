//
//  HintFrame.swift
//  Random Picross
//
//  Created by Vincent Hoang on 10/15/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

import SwiftUI

struct HintFrame: View {
    let hintArray: [Int]
    let color: Color
    let boardSize: BoardSize
    
    var body: some View {
        if boardSize == BoardSize.LARGE {
            let large = VStack(spacing: 0.5) {
                ForEach(hintArray, id: \.self) { hint in
                    HintText(String(hint), Font.caption2)
                }
            }
            .frame(width: 18, height: 90, alignment: .center)
            .background(color)
            .border(Color.white, width: 0.4)
            .cornerRadius(4.0)
            
            large
        } else if boardSize == BoardSize.MEDIUM {
            let medium = VStack(spacing: 0.5) {
                ForEach(hintArray, id: \.self) { hint in
                    HintText(String(hint), Font.body)
                }
            }
                .frame(width: 27, height: 135, alignment: .center)
                .background(color)
                .border(Color.white, width: 0.4)
                .cornerRadius(4.0)
                
                medium
        } else {
            let small = VStack(spacing: 0.5) {
                ForEach(hintArray, id: \.self) { hint in
                    HintText(String(hint), Font.title2)
                }
            }
                .frame(width: 36, height: 135, alignment: .center)
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

struct HintFrame_Previews: PreviewProvider {
    static var previews: some View {
        HintFrame([3, 2, 1], Color.red, BoardSize.SMALL)
        HintFrame([3, 2, 1], Color.red, BoardSize.MEDIUM)
        HintFrame([3, 2, 1], Color.red, BoardSize.LARGE)
    }
}
