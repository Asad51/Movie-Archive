//
//  StatusSelectionView.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 8/1/24.
//

import SwiftUI

struct StatusSelectionView: View {
    @Binding var filterOption: FilterOption
    @State private var status: Status = .unknown

    var body: some View {
        Picker("", selection: $status) {
            ForEach(Status.allCases, id: \.rawValue) { status in
                Text(status.description)
                    .tag(status)
            }
        }
        .onChange(of: status) {
            filterOption = .status(status: status.rawValue)
        }
        .onAppear {
            if case let .status(status) = filterOption {
                self.status = Status(rawValue: status) ?? .unknown
            }
        }
    }
}

#Preview {
    StatusSelectionView(filterOption: .constant(.status(status: Status.neverWatched.rawValue)))
}
