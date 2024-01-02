//
//  FilterOption.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 3/1/24.
//

import Foundation

enum FilterOption {
    case none
    case director(String)
    case year(Date)
    case genre(String)
    case rating(Double)
    case status(Status)
}
