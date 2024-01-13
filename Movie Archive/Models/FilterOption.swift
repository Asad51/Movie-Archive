//
//  FilterOption.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 3/1/24.
//

import Foundation
import SwiftUI

enum FilterOption: CaseIterable, Hashable {
    static var allCases: [FilterOption] {
        return [.none, .language(), .year(), .genre(), .rating(), .status(), .director()]
    }

    case none
    case language(language: String = Language.english.rawValue)
    case year(year: Date = Date(from: "2023"))
    case genre(genre: String = Genre.action.rawValue)
    case rating(rating: Double = 0.0)
    case status(status: Status = .neverWatched)
    case director(name: String = "")

    var description: String {
        switch self {
            case .none:
                "None"
            case .language:
                "Language"
            case .year:
                "Year"
            case .genre:
                "Genre"
            case .rating:
                "Rating"
            case .status:
                "Status"
            case .director:
                "Director"
        }
    }
}
