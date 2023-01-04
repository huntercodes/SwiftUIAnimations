//
//  ContentView.swift
//  Animations
//
//  Created by hunter downey on 11/14/21.
//

import SwiftUI

struct CornerRotateModifier : ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifier(amount: -90, anchor: .topLeading), identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}

struct ContentView: View {
    @State private var isShowingPurp = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.gray)
                .frame(width: 200, height: 200)
            
            if isShowingPurp {
                Rectangle()
                    .fill(.purple)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation{
                isShowingPurp.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
