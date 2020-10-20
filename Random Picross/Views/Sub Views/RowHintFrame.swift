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
    
    var body: some View {
        HStack(spacing: 3.0) {
            ForEach(hintArray, id: \.self) { hint in
                HintText(String(hint))
            }
        }
        .frame(width: 75, height: 18, alignment: .center)
        .background(color)
    }
    
    init(_ hintArray: [Int], _ color: Color) {
        self.hintArray = hintArray
        self.color = color
    }
}

struct RowHintFrame_Previews: PreviewProvider {
    static var previews: some View {
        RowHintFrame([6, 5, 4], Color.red)
    }
}
