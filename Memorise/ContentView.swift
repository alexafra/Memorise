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
    var isFaceUp: Bool = false
    var body: some View {
        ZStack(content: {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(lineWidth: 5)
                Text("🤡")
                    .font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 20)
            }
            
        })
    }
}







#Preview {
    ContentView()
}
