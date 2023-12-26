//
//  Color+Extensions.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 26/12/23.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: "#", with: "")
        var argb: UInt64 = 0

        Scanner(string: hexString).scanHexInt64(&argb)

        let a, r, g, b: UInt64
        
        switch hexString.count {
            case 3: // RGB (12-bit)
                (a, r, g, b) = (255, (argb >> 8) * 17, (argb >> 4 & 0xF) * 17, (argb & 0xF) * 17)
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, argb >> 16, argb >> 8 & 0xFF, argb & 0xFF)
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (argb >> 24, argb >> 16 & 0xFF, argb >> 8 & 0xFF, argb & 0xFF)
            default:
                (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
