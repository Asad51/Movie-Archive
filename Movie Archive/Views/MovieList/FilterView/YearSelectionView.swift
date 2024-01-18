//
//  YearSelectionView.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 8/1/24.
//

import SwiftUI

struct YearSelectionView: View {
    @Binding var filterOption: FilterOption
    @State private var year: Date = Date()

    let years = Array(1900 ... 2024)
        .reversed()
        .map { Date(from: "\($0)") }

    var body: some View {
        Picker("Year", selection: $year) {
            Text("Select Year")
            
            ForEach(years, id: \.self) { year in
                Text(year, format: .dateTime.year())
                    .tag(year)
            }
        }
        .onChange(of: year) {
            filterOption = .year(year: year)
        }
        .onAppear {
            if case let .year(year) = filterOption {
                self.year = year
            }
        }
    }
}

#Preview {
    YearSelectionView(filterOption: .constant(.year()))
}
