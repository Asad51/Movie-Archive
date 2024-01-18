//
//  RatingSelectionView.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 8/1/24.
//

import SwiftUI

struct RatingSelectionView: View {
    @Binding var filterOption: FilterOption
    @State private var rating: Int = 0

    var body: some View {
        Picker("", selection: $rating) {
            Text("Select Rating")
            ForEach(1 ..< 10, id: \.self) { ratingValue in
                Text("\(ratingValue)+")
                    .tag(ratingValue)
            }
        }
        .onChange(of: rating) {
            filterOption = .rating(rating: Double(rating))
        }
        .onAppear {
            if case let .rating(rating) = filterOption {
                self.rating = Int(rating)
            }
        }
    }
}

#Preview {
    RatingSelectionView(filterOption: .constant(.rating()))
}
