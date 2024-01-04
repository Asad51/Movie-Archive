//
//  FilterOption.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 3/1/24.
//

import Foundation

enum FilterOption: String, CaseIterable {
    case none = "None"
    case director = "Director"
    case year = "Year"
    case genre = "Genre"
    case rating = "Rating"
    case status = "Status"
}
