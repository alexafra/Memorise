//
//  ContentView.swift
//  Memorise
//
//  Created by Alexander Frazis on 5/8/2024.
//
import SwiftUI
//import System


struct ContentView: View {
    let emojis = ["🤡", "👻", "😺", "👹", "💀", "👺", "🎃", "👿", "🤠", "👽","🤡", "👻", "😺", "👹", "💀", "👺", "🎃", "👿", "🤠", "👽","🤡", "👻", "😺", "👹", "💀", "👺", "🎃", "👿", "🤠", "👽","🤡", "👻", "😺", "👹", "💀", "👺", "🎃", "👿", "🤠", "👽","🤡", "👻", "😺", "👹", "💀", "👺", "🎃", "👿", "🤠", "👽","🤡", "👻", "😺", "👹", "💀", "👺", "🎃", "👿", "🤠", "👽","🤡", "👻", "😺", "👹", "💀", "👺", "🎃", "👿", "🤠", "👽","🤡", "👻", "😺", "👹", "💀", "👺", "🎃", "👿", "🤠", "👽","🤡", "👻", "😺", "👹", "💀", "👺", "🎃", "👿", "🤠", "👽","🤡", "👻", "😺", "👹", "💀", "👺", "🎃", "👿", "🤠", "👽","🤡", "👻", "😺", "👹", "💀", "👺", "🎃", "👿", "🤠", "👽",]
    
    @State var cardCount = 4
    var body: some View {
        VStack {
            ScrollView {
                cards
            }.padding()
            cardCountAdjusters
        }.padding()
        
    }
    var cards: some View {
        VStack {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 90)),]) {
                ForEach (0..<cardCount , id: \.self) { index in
                    CardView(isFaceUp: true, content: emojis[index] )
                        .aspectRatio(2/3, contentMode: .fit)
                }
            }
        }
        
        .foregroundColor(.orange)
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardCountAdjuster(by: -3, symbol: "rectangle.stack.badge.minus.fill")
            Spacer()
            cardCountAdjuster(by: +3, symbol: "rectangle.stack.badge.plus.fill")
        }.font(.largeTitle)
    }
    
    func cardCountAdjuster (by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 0 || cardCount + offset >= emojis.count)
    }
}

struct CardView : View {
    @State var isFaceUp = false
    let content: String
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 20)
//            let base = Circle()
            Group {
                base.foregroundColor (.white)
                base.strokeBorder(lineWidth: 5)
                Text(content)
                    .font(.largeTitle)
            }.opacity(isFaceUp ? 100 : 0)
            
            
            base.opacity(isFaceUp ? 0 : 100)
            
        }.onTapGesture {
            print("tapped")
            isFaceUp.toggle()
        }
    }
}





#Preview {
    ContentView()
}
