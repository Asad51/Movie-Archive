//
//  IMDBRatingCircle.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 25/12/23.
//

import SwiftUI

struct IMDBRatingCircle: View {
    var rating: Double
    var circleWidth: Double

    var body: some View {
        Circle()
            .frame(width: circleWidth)
            .overlay {
                Text(String(format: "%.1f", rating))
                    .foregroundStyle(.white)
            }
            .overlay(
                Circle()
                    .inset(by: 3)
                    .stroke(.gray, lineWidth: 3.0)
            )
            .overlay {
                let ratingColor = Constants.ratingColors[max(0, Int(rating / 1.0) - 1)]
                Circle()
                    .inset(by: 3)
                    .trim(from: 0.0, to: rating * 0.1).rotation(.degrees(-90))
                    .stroke(ratingColor, lineWidth: 3.0)
            }
    }
}

#Preview {
    IMDBRatingCircle(rating: 5.4, circleWidth: 50)
}
