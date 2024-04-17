//
//  FilterView.swift
//  car-list-sample
//
//  Created by Robert Bryan Esguerra on 16/4/24.
//

import SwiftUI

struct FilterView: View {
    let makes: [String]
    let models: [String]
    @Binding var selectedMake: String
    @Binding var selectedModel: String

    var body: some View {
        VStack(spacing: 10) {
            DefaultTextStyle(title: L10n.Filters.Title.label,
                             size: 22,
                             fontWeight: .w400,
                             textAlign: .leading)
                .padding(.leading, 20)
            PickerView(items: makes, label: L10n.Filters.Make.label, selectedOption: $selectedMake)
            PickerView(items: models, label: L10n.Filters.Model.label, selectedOption: $selectedModel)
        }
        .frame(height: 160)
        .background(Asset.Color.darkGray.swiftUIColor)
        .cornerRadius(10)
        .padding()
    }
}
