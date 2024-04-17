//
//  PickerView.swift
//  car-list-sample
//
//  Created by Robert Bryan Esguerra on 16/4/24.
//

import SwiftUI

struct PickerView: View {
    var items: [String]
    var label: String
    @Binding var selectedOption: String
    @State private var isPickerPresented = false
    @State private var isPickerVisible = false

    var body: some View {
        HStack {
            Spacer()
            Picker(selection: $selectedOption, label: DefaultTextStyle(title: label)) {
                ForEach(items, id: \.self) { item in
                    DefaultTextStyle(title: item).tag(item)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .alignmentGuide(.leading) { _ in 0 }
            .alignmentGuide(.trailing) { _ in 0 }
            .pickerStyle(MenuPickerStyle())
            .background(.white)
            Spacer()
        }
        .cornerRadius(10)
        .padding(.leading, 15)
        .padding(.trailing, 15)
    }
}
