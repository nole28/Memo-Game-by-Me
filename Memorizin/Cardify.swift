//
//  Cardify.swift
//  Memorizin
//
//  Created by Novak Velimirovic on 21.2.25..
//

import SwiftUI

struct Cardify: ViewModifier {
    let isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            base.strokeBorder(lineWidth: Constants.lineWidth)
                .background(base.fill(.white))
                .overlay(content)
                .opacity(isFaceUp ? 1 : 0)
            base.fill()
                .opacity(isFaceUp ? 0 : 1)
        }
    }
      
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
         self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
//                Pie(endAngle: .degrees(240))
//                    .opacity(Constants.Pie.opacity)
//                    .overlay(
//                        Text(card.content)
//                            .font(.system(size: Constants.FontSize.largest))
//                            .minimumScaleFactor(Constants.FontSize.scaleFactor)
//                            .multilineTextAlignment(.center)
//                            .aspectRatio(1 ,contentMode: .fit)
//                            .padding(Constants.Pie.inset)
//                    )
//                    .padding(Constants.inset)
