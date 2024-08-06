//
//  ContentView.swift
//  Memorise
//
//  Created by Alexander Frazis on 5/8/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView(isFaceUp: true )
            CardView()
            CardView()
        }
        
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView : View {
    @State var isFaceUp = false
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 20)
//            let base = Circle()
            if isFaceUp {
                base.foregroundColor (.white)
                base.strokeBorder(lineWidth: 5)
            Text("🤡")
                .font(.largeTitle)
            } else {
                base
            }
        }.onTapGesture {
            print("tapped")
            isFaceUp.toggle()
        }
    }
}





#Preview {
    ContentView()
}
