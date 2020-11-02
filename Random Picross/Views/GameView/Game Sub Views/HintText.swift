//
//  HintText.swift
//  Random Picross
//
//  Created by Vincent Hoang on 10/15/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

import SwiftUI

struct HintText: View {
    let hint: String
    let fontSize: Font
    
    init(_ hint: String, _ fontSize: Font) {
        self.hint = hint
        self.fontSize = fontSize
    }
    
    var body: some View {
        Text(hint).font(fontSize).foregroundColor(.white)
    }
}

struct HintText_Previews: PreviewProvider {
    static var previews: some View {
        HintText("1", .caption2)
    }
}
