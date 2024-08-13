//
//  EmojiMemoryGameViewModel.swift
//  Memorise
//
//  Created by Alexander Frazis on 10/8/2024.
//
   
import SwiftUI
import Observation



@Observable
class EmojiMemoryGameViewModel {
    
    private static let emojis = ["🤡", "👻", "😺", "👹", "💀", "👺", "🎃", "👿", "🤠", "👽",]
    
    private static func createMemoryGame() -> MemoryGameModel<String> {
        return MemoryGameModel(numberOfPairsOfCards: 12) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
            
        }
    }
        
    private var model = createMemoryGame()
     
    var cards: [MemoryGameModel<String>.Card] {
        return model.cards
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGameModel<String>.Card) {
        model.choose(card)
    }
}


