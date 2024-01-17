//
//  UserRatingView.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 14/1/24.
//

import SwiftUI

struct UserRatingView: View {
    @Binding var currentRating: Int
    let maxRating: Int
    let symbolName: String
    let foregroundColor: Color

    init(currentRating: Binding<Int>, maxRating: Int = 5, symbolName: String = "star", foregroundColor: Color = .yellow) {
        _currentRating = currentRating
        self.maxRating = maxRating
        self.symbolName = symbolName
        self.foregroundColor = foregroundColor
    }

    var body: some View {
        ZStack {
            StarsView(currentRating: $currentRating, maxRating: maxRating, symbolName: symbolName, symbolVariant: .none, foregroundColor: foregroundColor)
                .overlay {
                    overlayView
                        .mask(alignment: .leading) {
                            StarsView(currentRating: $currentRating, maxRating: maxRating, symbolName: symbolName, symbolVariant: .fill, foregroundColor: foregroundColor)
                        }
                }
        }
    }

    private var overlayView: some View {
        GeometryReader { proxy in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundStyle(foregroundColor)
                    .frame(width: CGFloat(currentRating) / CGFloat(maxRating) * proxy.size.width)
            }
        }
        .allowsHitTesting(false)
    }
}


struct StarsView: View {
    @Binding var currentRating: Int
    let maxRating: Int

    let symbolName: String
    let symbolVariant: SymbolVariants
    let foregroundColor: Color

    init(currentRating: Binding<Int>, maxRating: Int, symbolName: String, symbolVariant: SymbolVariants, foregroundColor: Color) {
        _currentRating = currentRating
        self.maxRating = maxRating
        self.symbolName = symbolName
        self.symbolVariant = symbolVariant
        self.foregroundColor = foregroundColor
    }

    var body: some View {
        HStack(spacing: 0) {
            ForEach(1...maxRating, id: \.self) { rating in
                Image(systemName: symbolName)
                    .resizable()
                    .symbolVariant(symbolVariant)
                    .scaledToFit()
                    .frame(width: 30)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            currentRating = rating
                        }
                    }
            }
        }
        .foregroundStyle(foregroundColor)
    }
}

#Preview {
    UserRatingView(currentRating: .constant(7), maxRating: 10, symbolName: "heart", foregroundColor: .pink)
}
