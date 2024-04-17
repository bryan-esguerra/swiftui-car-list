//
//  BannerView.swift
//  car-list-sample
//
//  Created by Robert Bryan Esguerra on 16/4/24.
//

import SwiftUI

struct BannerView: View {
    var body: some View {
        ZStack {
            Image(uiImage: Asset.Image.tacoma.image)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fill)

            VStack {
                Spacer()
                DefaultTextStyle(title: L10n.Banner.Title.label,
                                 size: 36,
                                 fontWeight: .w700,
                                 textAlign: TextAlignment.leading)
                DefaultTextStyle(title: L10n.Banner.Title.description,
                                 size: 22,
                                 fontWeight: .w500,
                                 textAlign: TextAlignment.leading)
            }
            .padding(20)
            .alignmentGuide(.bottom) { _ in 0 }
            .alignmentGuide(.trailing) { _ in 0 }
        }
    }
}
