//
//  Director.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 11/1/24.
//

import Foundation
import SwiftData

@Model
class Director {
    @Attribute(.unique)
    var name: String

    var birthDate: Date
    var country: String
    var picture: String
    var biography: String

    @Relationship(deleteRule: .cascade, inverse: \Movie.director)
    var movies: [Movie] = []

    init(name: String, birthDate: Date, country: String, picture: String, biography: String) {
        self.name = name
        self.birthDate = birthDate
        self.country = country
        self.picture = picture
        self.biography = biography
    }
}
