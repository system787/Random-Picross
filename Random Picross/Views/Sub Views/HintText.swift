//
//  HintText.swift
//  Random Picross
//
//  Created by Vincent Hoang on 10/15/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

import SwiftUI

struct HintText: View {
    var hint: String
    
    init(_ hint: String) {
        self.hint = hint
    }
    
    var body: some View {
        Text(hint).font(.subheadline).foregroundColor(.white)
    }
}

struct HintText_Previews: PreviewProvider {
    static var previews: some View {
        HintText("1")
    }
}
