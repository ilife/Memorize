//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Computer on 06/03/22.
//

import SwiftUI
//ViewModel

class EmojiMemoryGame: ObservableObject {
    static let emojis = [ "🚎", "🚎", "🚘", "🚜", "🚁", "⛵️", "🛵", "🏎", "🚂", "✈️", "🛸", "🚲" ]
    @Published private(set) var model: MemoryGame<String> = MemoryGame<String>(numberOfPairOfCards: 10) { index in emojis[index] }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
