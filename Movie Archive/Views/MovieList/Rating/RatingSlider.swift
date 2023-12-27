//
//  RatingSlider.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 27/12/23.
//

import SwiftUI

struct RatingSlider: View {
    @Binding var rating: Double

    let sliderColor = LinearGradient(colors: [.red, .yellow, .green, .cyan, .blue], startPoint: .leading, endPoint: .trailing)

    var body: some View {
        GeometryReader { proxy in
            let frame = proxy.frame(in: .global)
            let widthPerRating = frame.width / 10

            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 15.0)
                    .frame(height: 30)
                    .foregroundStyle(
                        sliderColor
                    )

                Circle()
                    .frame(width: 40)
                    .foregroundStyle(.blue)
                    .shadow(radius: 10)
                    .overlay {
                        Circle()
                            .stroke(.white, lineWidth: 15)

                        Text(String(format: "%.1f", rating))
                            .offset(y: 40)
                    }
                    .offset(x: widthPerRating * rating - 20)
                    .gesture(
                        DragGesture(minimumDistance: 0, coordinateSpace: .local)
                            .onChanged { dragValue in
                                updateSlider(widthPerRating: widthPerRating, dragValue: dragValue)
                            }
                    )
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 5)
        .padding(.bottom, 40)
        .frame(height: 70)
    }

    func updateSlider(widthPerRating: CGFloat, dragValue: DragGesture.Value) {
        if dragValue.location.x < 0.0 {
            rating = 0
        } else {
            let sliderValue: Double = dragValue.location.x / widthPerRating

            rating = min(10, sliderValue.rounded(to: 1))
        }
    }
}

#Preview {
    RatingSlider(rating: .constant(8.4))
}
