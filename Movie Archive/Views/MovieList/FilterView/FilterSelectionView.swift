//
//  FilterSelectionView.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 8/1/24.
//

import SwiftUI

struct FilterSelectionView: View {
    @Binding var filterOption: FilterOption

    @State private var selectedOption: FilterOption = .none

    var body: some View {
        HStack {
            // MARK: - Filter option picker

            HStack {
                Text("Filter:")

                Picker("Select filter option", selection: $selectedOption) {
                    ForEach(FilterOption.allCases, id: \.description) { option in
                        Text(option.description)
                            .tag(option)
                    }
                }
                .pickerStyle(.menu)
                .onChange(of: selectedOption) {
                    filterOption = selectedOption
                }
            }

            // MARK: - Filter value picker

            switch selectedOption {
                case .none:
                    Text("")
                case .language:
                    LanguageSelectionView(filterOption: $filterOption)
                case .year:
                    YearSelectionView(filterOption: $filterOption)
                case .genre:
                    Text("Not Implemented")
                // GenreSelectionView(filterOption: $filterOption)
                case .rating:
                    RatingSelectionView(filterOption: $filterOption)
                case .status:
                    Text("Not Implemented")
                    // StatusSelectionView(filterOption: $filterOption)
            }
        }
    }
}

#Preview {
    FilterSelectionView(filterOption: .constant(.language()))
}
