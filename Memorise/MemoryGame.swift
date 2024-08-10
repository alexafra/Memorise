//
//  MemoriseGame.swift
//  Memorise
//
//  Created by Alexander Frazis on 10/8/2024.
//

import Foundation

struct MemoryGame<CardContent> {
    
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        let content: CardContent
    }
}

