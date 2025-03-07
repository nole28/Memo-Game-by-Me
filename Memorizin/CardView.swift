//
//  CardView.swift
//  Memorizin
//
//  Created by Novak Velimirovic on 13.2.25..
//

import SwiftUI

struct CardView: View {
    typealias Card = MemoryGame<String>.Card
    
    let card: Card
    
    init(_ card: Card) {
        self.card = card
    }
    
    
    var body: some View {
        Pie(endAngle: .degrees(240))
            .opacity(Constants.Pie.opacity)
            .overlay(
                Text(card.content)
                    .font(.system(size: Constants.FontSize.largest))
                    .minimumScaleFactor(Constants.FontSize.scaleFactor)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1 ,contentMode: .fit)
                    .padding(Constants.Pie.inset)
                    .rotationEffect(.degrees(card.isMatched ? 360 : 0))
                    .animation(.spin(duration: 1), value: card.isMatched)

//                    .animation(.linear(duration: 1.3).repeatForever(autoreverses: true), value: card.isMatched)
//                    .animation((.snappy), value: card.isMatched)
            )
            .padding(Constants.inset)
            .cardify(isFaceUp: card.isFaceUp)
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)

        
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
        static let inset: CGFloat = 5
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor = smallest / largest
        }
        struct Pie {
            static let opacity: CGFloat = 0.5
            static let inset: CGFloat = 5
        }
    }
}

extension Animation {
    static func spin(duration: TimeInterval) -> Animation {
        .linear(duration: 0.8).repeatForever(autoreverses: false)
    }
}




#Preview {
    typealias Card = CardView.Card
    
    return CardView(Card(isFaceUp: true, content: "x", id: "test"))
        .foregroundColor(.red)
        .padding(5)
}



#Preview {
    VStack {
        HStack {
            // First row with two cards
            CardView(MemoryGame<String>.Card(isFaceUp: true, content: "🫣", id: "test"))
                .aspectRatio(4/3, contentMode: .fit)
            CardView(MemoryGame<String>.Card(content: "c", id: "test"))
        }
        HStack {
            // Second row with two cards
            CardView(MemoryGame<String>.Card(isFaceUp: true, content: "x", id: "test"))
            CardView(MemoryGame<String>.Card(content: "c", id: "test"))
        }
        .padding()
        .foregroundColor(.red)
    }
}


struct CardView_Previews: PreviewProvider {
    typealias Card = MemoryGame<String>.Card
    static var previews: some View {
        VStack{
            HStack {
                CardView(Card(isFaceUp: true, content: "x", id: "test"))
                CardView(Card(content: "c", id: "test"))
            }
            HStack {
                CardView(Card(isFaceUp: true, isMatched: true, content: "x", id: "test"))
                CardView(Card(content: "Beata ❤️👶🏻", id: "test"))
            }
            .padding()
            .foregroundColor(.red)
        }
    }
}

