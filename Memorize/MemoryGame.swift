//
//  MemoryGame.swift
//  Memorize
//
//  Created by Computer on 06/03/22.
//

import Foundation
// Model
struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfTheOnlyFaceUpCard: Int? {
        get {
            cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
        }
        set {
            cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) }
        }
    }
    
    init(numberOfPairOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for index in 0..<numberOfPairOfCards {
            let cardContent = createCardContent(index)
            cards.append(Card(content: cardContent))
        }
    }
    
    mutating func choose(_ card: Card) {
        if let index = findIndex(card: card), !cards[index].isFaceUp, !cards[index].isMatched {
            if let potentialMatchIndex = indexOfTheOnlyFaceUpCard {
                if cards[potentialMatchIndex].content == cards[index].content {
                    cards[index].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                
                cards[index].isFaceUp = true
            } else {
                indexOfTheOnlyFaceUpCard = index
            }
        }
    }
    
    func findIndex(card: Card) -> Int? {
        return cards.firstIndex(where: { cardInArray in cardInArray.id == card.id })
    }
    
    struct Card: Identifiable {
        let id = UUID()
        
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
    }
}

extension Array {
    var oneAndOnly: Element? {
        if self.count == 1 {
            return self.first
        } else {
            return nil
        }
    }
}
