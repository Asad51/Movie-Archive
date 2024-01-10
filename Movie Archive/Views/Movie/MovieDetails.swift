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
                    // MARK: - Cover image

                    AsyncImage(url: URL(string: movie.coverUrl)) { image in
                        image
                            .coverModifier()
                    } placeholder: {
                        Image("no_cover")
                            .coverModifier()
                    }

                    VStack(alignment: .leading, spacing: 0) {
                        HStack(alignment: .top) {
                            // MARK: - Poster image

                            AsyncImage(url: URL(string: movie.posterUrl)) { image in
                                image
                                    .posterModifier()
                            } placeholder: {
                                Image("no_image")
                                    .posterModifier()
                            }

                            // MARK: Basic info

                            VStack(alignment: .leading) {
                                Text("\(movie.title)")
                                    .font(.headline)
                                    .lineLimit(2)

                                Text("\(movie.director) · \(movie.year.toString())")
                                    .font(.subheadline)
                            }
                            .foregroundStyle(.white)
                            .padding()
                            .offset(x: 20, y: 20)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.black.opacity(0.7))
                                    .offset(x: 20, y: 20)
                            )
                        }
                    }
                }
                .frame(maxHeight: 300)
                .padding(.vertical, 10)

                // MARK: - Genre view

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

                // MARK: - Overview

                MovieOverview(overview: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.")
                    .foregroundStyle(.black)

                Spacer()
            }
            .navigationTitle(movie.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // MARK: - Toolbar

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

            // MARK: - Deletion alert

            .alert("Do you want delete this movie from the library?", isPresented: $presentDeletionAlert) {
                Button("Cancel", role: .cancel) {}

                Button("Delete", role: .destructive) {
                    context.delete(movie)
                    dismiss()
                }
            }

            // MARK: - Edit view navigation

            .navigationDestination(isPresented: $navigateToEditing) {
                EditMovieView(movie: movie)
            }
        }
    }
}

private extension Image {
    // MARK: - Poster image modifier

    /// Modify poster image
    /// - Returns: Returns modified image
    func posterModifier() -> some View {
        self
            .resizable()
            .frame(width: 130, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(x: 20, y: 20)
            .shadow(color: .gray, radius: 5)
    }

    // MARK: - Cover image modifier

    /// Modify poster image
    /// - Returns: Returns modified image
    func coverModifier() -> some View {
        self
            .resizable()
            .scaledToFill()
            .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: 300)
            .brightness(-0.5)
    }
}

#Preview {
    SwiftDataPreview(previewContainer: PreviewContainer([Movie.self])) {
        NavigationStack {
            MovieDetails(movie: Movie.previewMovies[0])
        }
    }
}
