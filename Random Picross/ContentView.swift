//
//  ContentView.swift
//  Random Picross
//
//  Created by Vincent Hoang on 10/6/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button(action: buttonTapped){
            Text("     ")
            }.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2).background(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
    }
    
    func buttonTapped() {
        print("test")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
