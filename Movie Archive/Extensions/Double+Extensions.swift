//
//  Double+Extensions.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 27/12/23.
//

import Foundation

public extension Double {
    func rounded(to places: Int) -> Self {
        let divisor = pow(10.0, Double(places))

        return (self * divisor).rounded() / divisor
    }
}
