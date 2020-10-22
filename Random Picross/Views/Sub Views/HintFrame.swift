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
    
    var body: some View {
        VStack(spacing: 0.5) {
            ForEach(hintArray, id: \.self) { hint in
                HintText(String(hint))
            }
        }
        .frame(width: 18, height: 90, alignment: .center)
        .background(color)
        .border(Color.white, width: 0.4)
        .cornerRadius(4.0)
    }
    
    init(_ hintArray: [Int], _ color: Color) {
        self.hintArray = hintArray
        self.color = color
    }
}

struct HintFrame_Previews: PreviewProvider {
    static var previews: some View {
        HintFrame([3, 2, 1], Color.red)
    }
}
