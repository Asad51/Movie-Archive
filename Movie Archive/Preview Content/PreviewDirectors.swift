//
//  PreviewDirectors.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 11/1/24.
//

import Foundation

extension Director {
    static let previewDirectors: [Director] = [
        Director(
            name: "Francis Ford Coppola",
            birthDate: Date(from: "1939-04-07", with: "yyyy-MM-dd"),
            country: "USA",
            picture: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/3Pblihd6KjXliie9vj4iQJwbNPU.jpg",
            biography: """
            Francis Ford Coppola is an American film director, producer and screenwriter. He is widely acclaimed as one of Hollywood's most celebrated and influential film directors. He epitomized the group of filmmakers known as the New Hollywood, which included George Lucas, Martin Scorsese, Robert Altman, Woody Allen and William Friedkin, who emerged in the early 1970s with unconventional ideas that challenged contemporary filmmaking.

            He co-authored the script for Patton, winning the Academy Award in 1970. His directorial fame escalated with the release of The Godfather in 1972. The film revolutionized movie-making in the gangster genre, garnering universal laurels from critics and public alike. It went on to win three Academy Awards, including his second, which he won for Best Adapted Screenplay, and it was instrumental in cementing his position as one of the prominent American film directors. Coppola followed it with an equally successful sequel The Godfather Part II, which became the first ever sequel to win the Academy Award for Best Picture. The film received yet higher praises than its predecessor, and gave him three Academy Awards—for Best Adapted Screenplay, Best Director and Best Picture. In the same year was released The Conversation, which he directed, produced and wrote. The film went on to win the Palme d'Or at the 1974 Cannes Film Festival. His next directorial venture was Apocalypse Now in 1979, and it was as notorious for its lengthy and troubled production as it was critically acclaimed for its vivid and stark depiction of the Vietnam War. It won his second Palme d'Or at the 1979 Cannes Film Festival.
            """
        ),
        Director(
            name: "Frank Darabont",
            birthDate: Date(from: "1959-01-28", with: "yyyy-MM-dd"),
            country: "France",
            picture: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/7LqmE3p1XTwCdNCOmBxovq210Qk.jpg",
            biography: """
            Frank Darabont is a Hungarian-American film director, screenwriter and producer who has been nominated for three Academy Awards and a Golden Globe. He was born in France by Hungarian parents who fled Budapest during the 1956 uprising, but the family moved to Los Angeles while he was still an infant.

            He has directed the films The Shawshank Redemption, The Green Mile, and The Mist, all based on stories by Stephen King. In 2010 he developed and executive produced the first season of the AMC network television series The Walking Dead.

            Description above from the Wikipedia article Frank Darabont, licensed under CC-BY-SA, full list of contributors on Wikipedia.
            """
        ),
    ]
}
