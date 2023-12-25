//
//  Date+Extensions.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 25/12/23.
//

import Foundation

extension Date {
    static func yearOnly(from string: String) -> Date {
        string.toDate(with: "yyyy")
    }
}
