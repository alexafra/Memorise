//
//  EmojiMemoryGameView.swift
//  Memorise
//
//  Created by Alexander Frazis on 5/8/2024.
//
import SwiftUI
//import System


struct EmojiMemoryGameView: View {
    
    @Environment(EmojiMemoryGameViewModel.self) var viewModel: EmojiMemoryGameViewModel
    
    var body: some View {
        VStack {
            ScrollView {
                cards
                    .animation(.default, value: viewModel.cards)
            }.padding()
            
            Button {
                viewModel.shuffle() 
            } label:  {
                Text("Shuffle")
            }
        }
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100), spacing: 0)], spacing: 0) {
            ForEach (viewModel.cards) { card in
                
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(5)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
        .foregroundColor(.orange)
    }
    
}

struct CardView : View {
    
    let card: MemoryGameModel<String>.Card
    
    init(_ card: MemoryGameModel<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 20)
//            let base = Circle()
            Group {
                base.foregroundColor (.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 100 : 0)
            base.opacity(card.isFaceUp ? 0 : 100)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}





#Preview {
    EmojiMemoryGameView()
        .environment(EmojiMemoryGameViewModel())
}
 





//var cardCountAdjusters: some View {
//    HStack {
//        cardCountAdjuster(by: -3, symbol: "rectangle.stack.badge.minus.fill")
//        Spacer()
//        cardCountAdjuster(by: +3, symbol: "rectangle.stack.badge.plus.fill")
//    }.font(.largeTitle)
//}
//
//func cardCountAdjuster (by offset: Int, symbol: String) -> some View {
//    Button {
//        cardCount += offset
//    } label: {
//        Image(systemName: symbol)
//    }
//    .disabled(cardCount + offset < 0 || cardCount + offset >= emojis.count)
//}











//let emojis = ["🤡", "👻", "😺", "👹", "💀", "👺", "🎃", "👿", "🤠", "👽","🤡", "👻", "😺", "👹", "💀", "👺", "🎃", "👿", "🤠", "👽","🤡", "👻", "😺", "👹", "💀", "👺", "🎃", "👿", "🤠", "👽","🤡", "👻", "😺", "👹", "💀", "👺", "🎃", "👿", "🤠", "👽","🤡", "👻", "😺", "👹", "💀", "👺", "🎃", "👿", "🤠", "👽","🤡", "👻", "😺", "👹", "💀", "👺", "🎃", "👿", "🤠", "👽","🤡", "👻", "😺", "👹", "💀", "👺", "🎃", "👿", "🤠", "👽","🤡", "👻", "😺", "👹", "💀", "👺", "🎃", "👿", "🤠", "👽","🤡", "👻", "😺", "👹", "💀", "👺", "🎃", "👿", "🤠", "👽","🤡", "👻", "😺", "👹", "💀", "👺", "🎃", "👿", "🤠", "👽","🤡", "👻", "😺", "👹", "💀", "👺", "🎃", "👿", "🤠", "👽",]
