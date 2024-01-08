//
//  StatusSelectionView.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 8/1/24.
//

import SwiftUI

struct StatusSelectionView: View {
    @Binding var filterOption: FilterOption
    @State private var status: Status = .neverWatched

    var body: some View {
        Picker("", selection: $status) {
            ForEach(Status.allCases, id: \.rawValue) { status in
                Text(status.description)
                    .tag(status)
            }
        }
        .onChange(of: status) {
            filterOption = .status(status: status)
        }
        .onAppear {
            filterOption = .status(status: status)
        }
    }
}

#Preview {
    StatusSelectionView(filterOption: .constant(.status(status: .neverWatched)))
}
