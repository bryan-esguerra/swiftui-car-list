//
//  DefaultTextStyle.swift
//  car-list-sample
//
//  Created by Robert Bryan Esguerra on 16/4/24.
//

import SwiftUI

struct DefaultTextStyle: View {
    var title: String
    var size: CGFloat = 16
    var fontColor: Color = .white
    var fontWeight: FontWeight = .w500
    var textAlign: TextAlignment = .center

    var body: some View {
        Text(title)
            .poppins(
                weight: fontWeight,
                size: size,
                color: fontColor
            )
            .textAlign(textAlign)
    }
}
