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

    var body: some View {
        HStack {
            Spacer()
            Picker(selection: $selectedOption, label: DefaultTextStyle(title: label)) {
                ForEach(items, id: \.self) { item in
                    DefaultTextStyle(title: item).tag(item)
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
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
