//
//  DifficultySelectionCarousel.swift
//  Random Picross
//
//  Created by Vincent Hoang on 10/22/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

import SwiftUI

struct DifficultySelectionCarousel: View {
    @GestureState private var dragState = DragState.inactive
    @State var currentIndex = 0
    
    var itemHeight: CGFloat
    var views: [AnyView]
    
    private func onDragEnded(drag: DragGesture.Value) {
        let dragThreshold: CGFloat = 200.0
        
        if drag.predictedEndTranslation.width > dragThreshold || drag.translation.width > dragThreshold {
            currentIndex -= 1
        } else if drag.predictedEndTranslation.width < (-1 * dragThreshold) || drag.translation.width < (-1 * dragThreshold) {
            currentIndex += 1
        }
    }
    
    func getRelativeLocation() -> Int {
        return ((views.count * 10000) + currentIndex) % views.count
    }
    
    func getHeight(_ position: Int) -> CGFloat {
        if position == getRelativeLocation() {
            return itemHeight
        } else {
            return itemHeight - 100
        }
    }
    
    func getOpacity(_ position: Int) -> Double {
        if position == getRelativeLocation()
            || position + 1 == getRelativeLocation()
            || position - 1 == getRelativeLocation()
            || position + 2 == getRelativeLocation()
            || position - 2 == getRelativeLocation()
            || position + 1 - views.count == getRelativeLocation()
            || position - 1 + views.count == getRelativeLocation()
            || position + 2 - views.count == getRelativeLocation()
            || position - 2 + views.count == getRelativeLocation() {
                return 1
            }
        return 0
    }
    
    func getOffset(_ position: Int) -> CGFloat {
        if position == getRelativeLocation() {
            return self.dragState.translation.width
        }
        
        if position == getRelativeLocation() + 1
            || (getRelativeLocation() == views.count - 1 && position == 0) {
            return self.dragState.translation.width + (300 + 20)
        }
        
        if position == getRelativeLocation() - 1
            || (getRelativeLocation() == 0 && position == views.count - 1) {
            return self.dragState.translation.width - (300 + 20)
        }
        
        if position == getRelativeLocation() + 2
            || (getRelativeLocation() == views.count - 1 && position == 1)
            || (getRelativeLocation() == views.count - 2 && position == 0) {
            return self.dragState.translation.width + (2 * (300 + 20))
        }
        
        if position == getRelativeLocation() - 2
            || (getRelativeLocation() == 1 && position == views.count - 1)
            || (getRelativeLocation() == 0 && position == views.count - 2) {
            return self.dragState.translation.width - (2 * (300 + 20))
        }
        
        if position == getRelativeLocation() + 3
            || (getRelativeLocation() == views.count - 1 && position == 2)
            || (getRelativeLocation() == views.count - 2 && position == 1)
            || (getRelativeLocation() == views.count - 3 && position == 0) {
            return self.dragState.translation.width + (3 * (300 + 20))
        }
        
        if position == getRelativeLocation() - 3
            || (getRelativeLocation() == 2 && position == views.count - 1)
            || (getRelativeLocation() == 1 && position == views.count - 2)
            || (getRelativeLocation() == 0 && position == views.count - 3) {
            return self.dragState.translation.width - (3 * (300 + 20))
        }
        
        return 10000.0
    }
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    ForEach(0..<views.count) { i in
                        VStack {
                            Spacer()
                            self.views[i]
                                .frame(width: 300, height: self.getHeight(i))
                                .animation(.interpolatingSpring(stiffness: 800.0, damping: 50.0, initialVelocity: 50.0))
                                .background(Color.white)
                                .cornerRadius(10.0)
                                .shadow(radius: 3.0)
                                .opacity(self.getOpacity(i))
                                .animation(.interpolatingSpring(stiffness: 800.0, damping: 50.0, initialVelocity: 50.0))
                                .offset(x: self.getOffset(i))
                                .animation(.interpolatingSpring(stiffness: 800.0, damping: 50.0, initialVelocity: 50.0))

                            Spacer()
                        }
                    }
                }
                .gesture(DragGesture()
                            .updating($dragState) { drag, state, transaction in
                                state = .dragging(translation: drag.translation)
                            }.onEnded(onDragEnded))
                
                Spacer()
            }
        }
    }
}

enum DragState {
    case inactive
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .inactive:
            return false
        case .dragging:
            return true
        }
    }
}
