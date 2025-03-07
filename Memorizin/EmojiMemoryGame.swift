//
//  EmojiMemoryGame.swift
//  Memorizin
//
//  Created by Novak Velimirovic on 4.1.25..
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emoji = ["👽","🥷🏿","🦜","🐍","🍄","🐞","🐥","🌎","⭐️","🔥","☕️","🎱","🎲","💊","♐️","🗿","🏆","🥊","✈️","🚔","🛟","🗿","🧪","🌡️","🌝","🌚","☀️","🌻","🦃","🦚","🎲","🐲","🐕","🦢","🦌","🐧"]
        
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 6) {  pairIndex in
            if emoji.indices.contains(pairIndex) {
                return emoji[pairIndex]
            } else {
                return "🧻"
            }
        }
    }
    
    @Published private var model = createMemoryGame()

    var cards: Array<Card> {
        return model.cards
    }
    
    var color: Color {
        .orange
    }
    
    var score: Int {
        model.score
    }
    
    //MARK: - Intent 1
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: Card) {
        model.choose(card: card)
    }
}
