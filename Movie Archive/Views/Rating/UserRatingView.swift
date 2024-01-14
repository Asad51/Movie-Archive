//
//  UserRatingView.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 14/1/24.
//

import SwiftUI

struct UserRatingView: View {
    @Binding var currentRating: Int
    let maxRating: Int = 5

    var body: some View {
        HStack(spacing: 0) {
            ForEach(1...maxRating, id: \.self) { rating in
                Image(systemName: "star")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                    .symbolVariant(rating <= currentRating ? .fill : .none)
                    .onTapGesture {
                        currentRating = rating
                    }
            }
        }
        .foregroundStyle(.yellow)
    }
}



#Preview {
    UserRatingView(currentRating: .constant(4))
}
