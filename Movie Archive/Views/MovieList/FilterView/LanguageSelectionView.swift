//
//  LanguageSelectionView.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 8/1/24.
//

import SwiftUI

struct LanguageSelectionView: View {
    @Binding var filterOption: FilterOption
    @State private var selectedLanguage: String = ""

    var body: some View {
        Picker("Language", selection: $selectedLanguage) {
            Text("Select Language")
            
            ForEach(Language.allCases, id: \.rawValue) { language in
                Text(language.rawValue)
                    .tag(language)
            }
        }
        .onChange(of: selectedLanguage) {
            filterOption = .language(language: selectedLanguage)
        }
        .onAppear {
            if case let .language(language) = filterOption {
                selectedLanguage = language
            }
        }
    }
}

#Preview {
    LanguageSelectionView(filterOption: .constant(.language()))
}
