//
//  MemoriseGame.swift
//  Memorise
//
//  Created by Alexander Frazis on 10/8/2024.
//

import Foundation

struct MemoryGameModel<CardContent> where CardContent: Equatable {
    
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        //add no. pairs of cards x 2
        //for control variable in iterable thing
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex)a"))
            cards.append(Card(content: content, id: "\(pairIndex)b"))
        }
    }
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { index in cards[index].isFaceUp }.only }
        set { cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0) } }
    }
    
    mutating func choose(_ card: Card) {
        guard let chosenIndex = cards.firstIndex(where: {$0.id == card.id }) else {
            print("chosen invalid index to flip")
            return
        }
        if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
            if let potentialMatchIndex =  indexOfTheOneAndOnlyFaceUpCard {
                if cards[potentialMatchIndex].content == card.content {
                    cards[potentialMatchIndex].isMatched = true
                    cards[chosenIndex].isMatched = true
                }
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp = true
        }
    }
    
    
    mutating func shuffle() {
//        try! await Task.sleep(for: .seconds(2))
        cards.shuffle()
        print(cards)
    }
    
    struct Card : Equatable, Identifiable, CustomDebugStringConvertible {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        
        let id: String
        
        var debugDescription: String {
            "\(id): \(content) \(isFaceUp ? "up" : "down")"
        }
        
        //        static func == (lhs: Card, rhs: Card) -> Bool {
        //            return lhs.content == rhs.content &&
        //            lhs.isMatched == rhs.isMatched &&
        //            lhs.isFaceUp == rhs.isFaceUp
        //
        //        }
    }
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
