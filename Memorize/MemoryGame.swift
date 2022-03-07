//
//  MemoryGame.swift
//  Memorize
//
//  Created by Computer on 06/03/22.
//

import Foundation
// Model
struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    init(numberOfPairOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for index in 0..<numberOfPairOfCards {
            let cardContent = createCardContent(index)
            cards.append(Card(content: cardContent))
        }
    }
    
    mutating func choose(_ card: Card) {
        let index = findIndex(card: card)
        cards[index].isFaceUp.toggle()
    }
    
    func findIndex(card: Card) -> Int {
        return cards.enumerated().filter({ card.id == $0.element.id }).map({ $0.offset }).first!
    }
    
    struct Card: Identifiable {
        var id = UUID()
        
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
    }
}
