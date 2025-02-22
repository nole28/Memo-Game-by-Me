//
//  EmojiMemoryGameView.swift
//  Memorizin
//
//  Created by Novak Velimirovic on 20.12.24..
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    private let aspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 4
    
    
    var body: some View {
        VStack{
            cards
                .foregroundColor(viewModel.color)
                .animation(.default, value: viewModel.cards)
            Button("Shuffle"){
                viewModel.shuffle()
                
            }
            .background(Color.blue)
        }
        .padding()
        
    }
    
    private var cards: some View {
        AspectVGrid(items: viewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .padding(5)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }
        .foregroundColor(Color.orange)
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
