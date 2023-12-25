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
                .padding(.horizontal, 15)
                .padding(.vertical, 5)
                .background(.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        .frame(maxWidth: .infinity)
        .padding(5)
        .border(.blue.opacity(0.2), width: 1)
        .background(.cyan.opacity(0.2))
    }
}

#Preview {
    GenreCapsule(genre: "Action")
}
