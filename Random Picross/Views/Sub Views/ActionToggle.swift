//
//  ActionToggle.swift
//  Random Picross
//
//  Created by Vincent Hoang on 10/19/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

import SwiftUI

struct ActionToggle: View {
    @EnvironmentObject var gameController: GameController
    
    var body: some View {
        Toggle(isOn: $gameController.actionToggle, label: {
            if gameController.actionToggle {
            Text("Marking Mode")
            } else {
                Text("Notes Mode")
            }
        }).frame(width: 200, height: 100, alignment: .center)
    }
}

struct ActionToggle_Previews: PreviewProvider {
    static var previews: some View {
        ActionToggle()
    }
}
