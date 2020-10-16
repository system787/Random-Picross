//
//  HintFrame.swift
//  Random Picross
//
//  Created by Vincent Hoang on 10/15/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

import SwiftUI

struct HintFrame: View {
    var hintArray: [Int]
    
    var body: some View {
        VStack {
            ForEach(hintArray, id: \.self) { hint in
                HintText(String(hint))
            }
        }
        .frame(width: 20, height: 80)
        .border(Color.gray, width: 3)
        .background(Color.gray)
        .cornerRadius(7)
        .shadow(radius: 3)
        
    }
    
    init(_ hintArray: [Int]) {
        self.hintArray = hintArray
    }
}

struct HintFrame_Previews: PreviewProvider {
    static var previews: some View {
        HintFrame([3, 2, 1])
    }
}
