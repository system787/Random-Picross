//
//  HomeView.swift
//  Random Picross
//
//  Created by Vincent Hoang on 10/15/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Home Screen Placeholder").font(.title).foregroundColor(Color.blue).shadow(radius: 3)
            Spacer().frame(height: 100)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
