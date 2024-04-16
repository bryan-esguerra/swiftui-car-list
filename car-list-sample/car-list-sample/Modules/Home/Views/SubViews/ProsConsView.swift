//
//  ProsConsView.swift
//  car-list-sample
//
//  Created by Robert Bryan Esguerra on 16/4/24.
//

import SwiftUI

struct ProsConsView: View {
    let title: String
    let items: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            DefaultTextStyle(title: title,
                             size: 14,
                             fontColor: Asset.Color.darkGray.swiftUIColor,
                             textAlign: .leading)
            ForEach(items.filter { !$0.isEmpty }, id: \.self) { item in
                HStack {
                    DefaultTextStyle(title: "•",
                                     size: 12,
                                     fontColor: Asset.Color.orange.swiftUIColor,
                                     textAlign: .leading)
                        .frame(width: 5)
                    DefaultTextStyle(title: item,
                                     size: 12,
                                     fontColor: .black,
                                     textAlign: .leading)
                }
                .padding(.leading, 10)
            }
        }
        .padding(.leading, 10)
        .transition(.opacity)
    }
}
