//
//  GameTile.swift
//  Random Picross
//
//  Created by Vincent Hoang on 10/15/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

import SwiftUI

struct GameTile: View {
    let x: Int
    let y: Int
    var function: (Int, Int) -> Void
    
    var body: some View {
        Button(action: { function(x, y) } ) {
            Image("tile_unchecked_18x18")
        }
            .frame(width: 18, height: 18, alignment: .topLeading)
            .border(Color.black, width: 0.2)
    }
    
    init(x: Int, y: Int, function: @escaping (Int, Int) -> Void) {
        self.x = x
        self.y = y
        self.function = function
    }
}

struct GameTile_Previews: PreviewProvider {
    static var previews: some View {
        GameTile(x: 0, y: 1, function: {x, y in })
    }
}
