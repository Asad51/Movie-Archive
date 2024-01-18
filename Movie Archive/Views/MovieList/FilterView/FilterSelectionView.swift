//
//  FilterSelectionView.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 8/1/24.
//

import SwiftUI

fileprivate enum MovieFilterSelection: String, CaseIterable {
    case none = "None"
    case language = "Language"
    case year = "Year"
    case genre = "Genre"
    case rating = "Rating"
    case status = "Status"
    case director = "Director"
}

struct FilterSelectionView: View {
    @Binding var filterOption: FilterOption

    @State private var selectedOption: MovieFilterSelection = .none
    @State private var initialValue: Bool = true

    var body: some View {
        HStack {
            // MARK: - Filter option picker

            HStack {
                Text("Filter:")

                Picker("Select filter option", selection: $selectedOption) {
                    ForEach(MovieFilterSelection.allCases, id: \.rawValue) { option in
                        Text(option.rawValue)
                            .tag(option)
                    }
                }
                .pickerStyle(.menu)
                .onChange(of: selectedOption) {
                    if initialValue == false {
                        filterOption = .none
                    }
                    initialValue = false
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
//                    GenreSelectionView(filterOption: $filterOption)
                case .rating:
                    RatingSelectionView(filterOption: $filterOption)
                case .status:
                    StatusSelectionView(filterOption: $filterOption)
                case .director:
                    Text("Not Implemented")
//                    DirectorSelectionView(filterOption: $filterOption)
            }
        }
        .onAppear {
            selectedOption = convert(from: filterOption)
        }
    }

    private func convert(from filterOption: FilterOption) -> MovieFilterSelection {
        switch filterOption {
            case .none:
                return .none
            case .language:
                return .language
            case .year:
                return .year
            case .genre:
                return .genre
            case .rating:
                return .rating
            case .status:
                return .status
            case .director:
                return .director
        }
    }
}

#Preview {
    SwiftDataPreview(previewContainer: PreviewContainer([Director.self]), items: Director.previewDirectors) {
        FilterSelectionView(filterOption: .constant(.language()))
    }
}
