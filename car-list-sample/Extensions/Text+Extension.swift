//
//  Text+Extension.swift
//  car-list-sample
//
//  Created by Robert Bryan Esguerra on 16/4/24.
//

import SwiftUI

enum FontWeight {
    case w300
    case w400
    case w500
    case w600
    case w700
}

extension Text {
    func poppins(
        weight: FontWeight = .w400,
        size: CGFloat = 12,
        color: Color = .black
    ) -> Text {
        let fontConvertible: FontConvertible

        let poppins = FontFamily.Poppins.self
        switch weight {
        case .w300:
            fontConvertible = poppins.light
        case .w400:
            fontConvertible = poppins.regular
        case .w500:
            fontConvertible = poppins.medium
        case .w600:
            fontConvertible = poppins.semiBold
        case .w700:
            fontConvertible = poppins.bold
        }
        return font(SwiftUI.Font(fontConvertible.font(size: size)))
            .foregroundColor(color)
    }

    func textAlign(_ textAlignment: TextAlignment) -> some View {
        let alignment: Alignment

        switch textAlignment {
        case .leading:
            alignment = .leading
        case .center:
            alignment = .center
        case .trailing:
            alignment = .trailing
        }

        return frame(maxWidth: .infinity, alignment: alignment)
            .multilineTextAlignment(textAlignment)
    }
}
