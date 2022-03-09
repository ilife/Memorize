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
        if let index = findIndex(card: card) {
            cards[index].isFaceUp.toggle()
        }
    }
    
    func findIndex(card: Card) -> Int? {
        return cards.firstIndex(where: { cardInArray in cardInArray.id == card.id })
    }
    
    struct Card: Identifiable {
        var id = UUID()
        
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
    }
}
