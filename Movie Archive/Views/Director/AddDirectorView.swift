//
//  AddDirectorView.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 11/1/24.
//

import Foundation
import SwiftUI

struct AddDirectorView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    @State private var name: String = ""
    @State private var birthDate: Date = .now
    @State private var country: String = ""
    @State private var pictureUrl: String = ""
    @State private var biography: String = ""

    var body: some View {
        Form {
            TextField("Enter name", text: $name)

            DatePicker("Birth date", selection: $birthDate, displayedComponents: .date)

            TextField("Country", text: $country)

            TextField("Picture URL", text: $pictureUrl)

            VStack(alignment: .leading) {
                Text("Biography:")
                TextEditor(text: $biography)
                    .frame(minHeight: 100, maxHeight: 200)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1)
                            .fill(.gray)
                    )
            }

            Button("Add") {
                let director = Director(name: name, birthDate: birthDate, country: country, picture: pictureUrl, biography: biography)
                context.insert(director)

                dismiss()
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .buttonStyle(.borderedProminent)
            .padding(.vertical)
            .disabled(name.isEmpty || country.isEmpty)
            .navigationTitle("Add Director")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NavigationStack {
        AddDirectorView()
            .navigationBarTitleDisplayMode(.inline)
    }
}
