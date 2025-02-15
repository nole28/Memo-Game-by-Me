//
//  CardView.swift
//  Memorizin
//
//  Created by Novak Velimirovic on 13.2.25..
//

import SwiftUI

struct CardView: View {
    typealias Card = MemoryGame<String>.Card
    
    let card: MemoryGame<String>.Card
    
    init(_ card: Card) {
        self.card = card
    }
    
   
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: Constants.lineWidth)
                Circle()
                    .opacity(0.4)
                Text(card.content)
                    .font(.system(size: Constants.FontSize.largest))
                    .minimumScaleFactor(Constants.FontSize.scaleFactor)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1 ,contentMode: .fit)
                    .padding(Constants.inset)
            }
                .opacity(card.isFaceUp ? 1 : 0)
                base.fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
        
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
        static let inset: CGFloat = 5
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 2
            static let scaleFactor = smallest / largest
        }
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
                CardView(Card(isFaceUp: true, content: "x", id: "test"))
                CardView(Card(content: "c", id: "test"))
            }
            .padding()
            .foregroundColor(.red)
        }
    }
}
