//
//  EmojiMemoryGameView.swift
//  Memorizin
//
//  Created by Novak Velimirovic on 20.12.24..
//

import SwiftUI

struct EmojiMemoryGameView: View {
    typealias Card = MemoryGame<String>.Card
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    private let aspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 4
    
    
    var body: some View {
        VStack{
            cards
                .foregroundColor(viewModel.color)
            HStack{
                score
                Spacer()
                shuffle
            }
            .font(.largeTitle)
        }
        .padding()
    }
    
    
    
    private var score: some View {
        Text("SCORE: \(viewModel.score)")
            .animation(nil)
    }
    
    private var shuffle: some View {
        Button(action: {
            withAnimation {
                viewModel.shuffle()
            }
        }) {
            Image(systemName: "shuffle") // Shuffle icon
                .font(.largeTitle) // Adjusts size
                .padding()
        }
    }
    
    private var cards: some View {
        AspectVGrid(items: viewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .padding(spacing)
                .overlay(FlyingNumber(number: scoreChange(causedBy: card)))
                .zIndex(scoreChange(causedBy: card) != 0 ? 1 : 0)
                .onTapGesture {
                    choose(card)
                 
                }
            
        }
    }
    
    private func choose(_ card: Card) {
        withAnimation {
            let scoreBeforeChoosing = viewModel.score
            viewModel.choose(card)
            let scoreChange = viewModel.score - scoreBeforeChoosing
            lastScoreChange = (scoreChange, causedByCardId: card.id)
        }
    }
    
    @State private var lastScoreChange = (0, causedByCardId: "")
    
    private func scoreChange(causedBy card: Card) -> Int {
        let (amount, id) = lastScoreChange
        return card.id == id ? amount : 0
    }
    
}



//    var cardCountAdjusters: some View {
//        HStack {
//            cardAdder
//            Spacer()
//            cardRemover
//        }
//        .padding()
//        .imageScale(.large)
//        .font(.largeTitle)
//    }
//    
//    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
//        Button(action: {
//            cardCount += offset
//        }, label: {
//            Image(systemName: symbol)
//        })
//        .disabled(cardCount + offset < 1 || cardCount + offset > emoji.count)
//    }
//    
//    var cardAdder: some View {
//        cardCountAdjuster(by: +1, symbol: "plus")
//        
//    }
//    
//    var cardRemover: some View {
//        cardCountAdjuster(by: -1, symbol: "minus")
//    }
    




#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame( ))
}
