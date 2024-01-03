//
//  MovieDetails.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 25/12/23.
//

import SwiftUI

struct MovieDetails: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    @State private var presentDeletionAlert: Bool = false
    @State private var navigateToEditing: Bool = false

    let movie: Movie

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.teal.opacity(0.3), .cyan.opacity(0.3), .orange.opacity(0.1)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 0) {
                ZStack(alignment: .topLeading) {
                    AsyncImage(url: URL(string: movie.coverUrl)) { image in
                        image
                            .coverModifier()
                    } placeholder: {
                        Image("no_cover")
                            .coverModifier()
                    }


                    AsyncImage(url: URL(string: movie.posterUrl)) { image in
                        image
                            .posterModifier()
                    } placeholder: {
                        Image("no_image")
                            .posterModifier()
                    }
                }
                .padding(.vertical, 10)

                GenreView(genres: movie.genres)

                HStack {
                    HStack {
                        IMDBRatingCircle(rating: movie.imdbRating, circleWidth: 60)

                        Text("IMDB Rating")
                    }

                    Divider()
                        .frame(maxHeight: 50)

                    Button {
                        // TODO: Play trailer from the URL
                    } label: {
                        Image(systemName: "play.fill")
                        Text("Play Trailer")
                    }
                    .foregroundStyle(.black)
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 30)
                .frame(maxWidth: .infinity)
                .background(
                    Rectangle()
                        .fill(.teal.opacity(0.3))
                        .shadow(radius: 5, y: 5)
                )

                MovieOverview(overview: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.")
                    .foregroundStyle(.black)

                Spacer()
            }
            .navigationTitle(movie.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: 0) {
                        Button {
                            navigateToEditing.toggle()
                        } label: {
                            Image(systemName: "square.and.pencil")
                        }

                        Button(role: .destructive) {
                            presentDeletionAlert.toggle()
                        } label: {
                            Image(systemName: "trash")
                        }
                        .foregroundStyle(.red)
                    }
                }
            }
            .alert("Do you want delete this movie from the library?", isPresented: $presentDeletionAlert) {
                Button("Cancel", role: .cancel) {}

                Button("Delete", role: .destructive) {
                    context.delete(movie)
                    dismiss()
                }
            }
            .navigationDestination(isPresented: $navigateToEditing) {
                EditMovieView(movie: movie)
            }
        }
    }
}

fileprivate extension Image {
    func posterModifier() -> some View {
        self
            .resizable()
            .frame(width: 130, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(x: 50, y: 50)
            .shadow(color: .gray, radius: 5)
    }

    func coverModifier() -> some View {
        self
            .resizable()
            .scaledToFill()
            .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: 300)
            .brightness(-0.5)
    }
}

#Preview {
    let previewController = PreviewController(Movie.self)

    return NavigationStack {
        MovieDetails(movie: Movie.previewMovies[0])
    }
    .modelContainer(previewController.container)
}
