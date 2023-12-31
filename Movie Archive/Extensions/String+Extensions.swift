//
//  String+Extensions.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 25/12/23.
//

import Foundation

extension String {
    func caseInsensitiveEquals(_ other: String) -> Bool {
        self.lowercased() == other.lowercased()
    }

    func toDate(with format: String = "yyyy-MM-dd") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self) ?? Date()
    }
}
