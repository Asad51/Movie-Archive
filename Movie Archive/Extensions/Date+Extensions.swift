//
//  Date+Extensions.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 25/12/23.
//

import Foundation

extension Date {
    init(from string: String, with format: String = "yyyy") {
        let date = string.toDate(with: format)
        self.init(timeInterval: 0, since: date)
    }

    func toString(with format: String = "yyyy") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
