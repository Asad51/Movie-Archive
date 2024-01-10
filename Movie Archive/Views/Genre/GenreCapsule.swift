//
//  GenreCapsule.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 25/12/23.
//

import SwiftUI

struct GenreCapsule: View {
    let genre: String

    var body: some View {
        HStack(alignment: .center) {
            Text(genre)
                .font(.caption2)
                .padding(.horizontal, 15)
                .padding(.vertical, 5)
                .background(.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
    }
}

#Preview {
    GenreCapsule(genre: "Action")
}
