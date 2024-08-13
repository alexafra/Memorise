//
//  ContentView.swift
//  Memorise
//
//  Created by Alexander Frazis on 5/8/2024.
// End Ass 1
import SwiftUI
//import System


struct ContentView: View {
//    let animalCharacters = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐔", "🐧", "🐦", "🐥", "🪿", "🐦‍⬛", "🦅", "🦉"]
//    let fruitCharacters = ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍈", "🍒", "🍑", "🥭", "🍍", "🥥"]
//    let ballCharacters = ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🥏", "🎱"]
    
    @State var characters: [CardTheme: [String]] = [
        .animal: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐔", "🐧", "🐦", "🐥", "🪿", "🐦‍⬛", "🦅", "🦉"],
        .fruit: ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍈", "🍒", "🍑", "🥭", "🍍", "🥥"],
        .ball: ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🥏", "🎱", "🪀"]
    ]
    
    var charactersInTheme : [String] {
        return characters[cardTheme] ?? [] // IS this safe????
    }
    
    @State var cardCount = 4
    @State var cardTheme: CardTheme = .animal
    
    var body: some View {
        VStack{
            
            header
            
            ScrollView {
                cards
            }
            themeAdjusters
            
        }
        .padding()
    }
    
    var header: some View {
        HStack {
            CardCountAdjuster(by: -3, symbolName: "rectangle.stack.badge.minus.fill")
            Spacer()
            Text("Memorise!").font(.largeTitle)
            Spacer()
            CardCountAdjuster(by: +3, symbolName: "rectangle.stack.badge.plus.fill")
            
        }.padding()
    }
    
    var themeAdjusters: some View {
        HStack {
            ThemeAdjuster(newTheme: .animal)
            Spacer()
            ThemeAdjuster(newTheme: .ball)
            Spacer()
            ThemeAdjuster(newTheme: .fruit)
        }
    }
    
    func ThemeAdjuster(newTheme: CardTheme) -> some View {
        Button {
            cardTheme = newTheme
            if (cardCount >= charactersInTheme.count) {
                cardCount = 4
            }
            characters[newTheme]?.shuffle()
        } label: {
            VStack {
                switch newTheme {
                case .animal:
                    Image(systemName: "pawprint.fill")
                    Text("Animals")
                        .font(.footnote)
                case .ball:
                    Image(systemName: "tennisball.fill")
                    Text("Balls")
                        .font(.footnote)
                case .fruit:
                    Image(systemName: "carrot.fill")
                    Text("Fruit")
                        .font(.footnote)
                }
            }
        }.font(.largeTitle)
//            .foregroundStyle(.red)
//            .disabled(newTheme == cardTheme)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))]) {
            ForEach(0..<cardCount, id: \.self ) { index in
                CardView(cardContent: charactersInTheme[index])
//                CardView(cardContent: charactersInTheme.randomElement() ?? "")
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
    }
    
    
    
    func CardCountAdjuster(by offset: Int, symbolName: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbolName)
        })
        .font(.largeTitle)
        .disabled(cardCount + offset < 0 || cardCount + offset > charactersInTheme.count)
    }
    
    
}

struct CardView: View {
    let cardContent: String
    @State var isFaceUp: Bool = true
    //Very interesting how isFaceUp remiains same as card system name changes
    //SOme memoisation (I think?) at play only updating essentials
    var body: some View {
        
        let baseCard = RoundedRectangle(cornerRadius: 20)
        ZStack {
            Group {
                baseCard.foregroundStyle(.white)
                baseCard
                    .stroke(lineWidth: 10)
                Text(cardContent)
                    .font(.largeTitle)
            }
            baseCard.foregroundStyle(.orange)
                .opacity(isFaceUp ? 0 : 100)
        }.foregroundStyle(.orange)
            .padding()
            
            .onTapGesture {
                isFaceUp = !isFaceUp
            }
    }
}

enum CardTheme {
    case animal
    case fruit
    case ball
}



#Preview {
    ContentView()
}
