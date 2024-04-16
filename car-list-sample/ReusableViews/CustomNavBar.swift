//
//  CustomNavBar.swift
//  car-list-sample
//
//  Created by Robert Bryan Esguerra on 16/4/24.
//

import SwiftUI

extension View {
    func showCustomNavBar() -> some View {
        VStack(spacing: 0) {
            CustomNavBar()
            self.frame(maxHeight: .infinity)
        }
    }
}

private struct CustomNavBar: View {
    let title: String = L10n.Nav.Title.label
    var body: some View {
        HStack(spacing: 0) {
            DefaultTextStyle(
                title: title,
                size: 30,
                fontColor: .white,
                fontWeight: .w700,
                textAlign: .leading
            )
            Image(systemName: "line.horizontal.3")
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .padding(15)
        .background(Asset.Color.orange.swiftUIColor)
    }
}
