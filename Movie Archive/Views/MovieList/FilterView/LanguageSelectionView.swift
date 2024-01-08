//
//  LanguageSelectionView.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 8/1/24.
//

import SwiftUI

struct LanguageSelectionView: View {
    @Binding var filterOption: FilterOption
    @State private var selectedLanguage: String = Language.english.rawValue

    var body: some View {
        Picker("Language", selection: $selectedLanguage) {
            ForEach(Language.allCases, id: \.rawValue) { language in
                Text(language.rawValue)
                    .tag(language)
            }
        }
        .onChange(of: selectedLanguage) {
            filterOption = .language(language: selectedLanguage)
        }
        .onAppear {
            filterOption = .language(language: selectedLanguage)
        }
    }
}

#Preview {
    LanguageSelectionView(filterOption: .constant(.language()))
}
