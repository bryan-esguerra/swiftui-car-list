//
//  CarListView.swift
//  car-list-sample
//
//  Created by Robert Bryan Esguerra on 16/4/24.
//

import Combine
import StarRating
import SwiftUI

struct CarListView: View {
    @ObservedObject var viewModel: CarListViewModel
    @State private var selectedIndex: Int? = 0

    var body: some View {
        ScrollView {
            BannerView()

            ForEach(Array(viewModel.cars.enumerated()), id: \.element.make) { index, car in
                CarView(car: car, index: index)
                    .padding(.leading, 15)
                    .padding(.trailing, 15)
                Spacer()
                LineDivider()
                    .padding(.leading, 25)
                    .padding(.trailing, 25)
            }
        }
        .navigationBarHidden(true)
        .showCustomNavBar()
    }
}

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
                                 size: 28,
                                 fontWeight: .w600,
                                 textAlign: TextAlignment.leading)
                DefaultTextStyle(title: L10n.Banner.Title.description,
                                 size: 16,
                                 fontWeight: .w400,
                                 textAlign: TextAlignment.leading)
            }
            .padding(20)
            .alignmentGuide(.bottom) { _ in 0 }
            .alignmentGuide(.trailing) { _ in 0 }
        }
    }
}

struct CarView: View {
    let car: CarDto
    let index: Int
    @State var customConfig = StarRatingConfiguration(
        spacing: 5,
        numberOfStars: 5,
        borderWidth: 0,
        shadowRadius: 0,
        fillColors: [Asset.Color.orange.swiftUIColor]
    )

    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                HStack {
                    Image(uiImage: car.imageForCar())
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 140, height: 70)
                        .aspectRatio(contentMode: .fit)

                    VStack {
                        DefaultTextStyle(title: car.model ?? "",
                                         size: 18,
                                         fontColor: Asset.Color.darkGray.swiftUIColor,
                                         fontWeight: .w600,
                                         textAlign: .leading)
                            .padding(.leading, 10)
                        DefaultTextStyle(title: L10n.List.Price.label(formatNumber(Int(car.customerPrice))),
                                         size: 14,
                                         fontColor: Asset.Color.darkGray.swiftUIColor,
                                         textAlign: .leading)
                            .padding(.leading, 10)
                        StarRating(initialRating: Double(car.rating), configuration: $customConfig)
                    }
                }
            }
            .padding(10)
        }
        .background(Asset.Color.lightGray.swiftUIColor)
    }

    func formatNumber(_ number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal

        if number >= 1000 && number < 1_000_000 {
            numberFormatter.maximumFractionDigits = 1
            return "\(numberFormatter.string(from: NSNumber(value: Double(number) / 1000)) ?? "")k"
        } else {
            return numberFormatter.string(from: NSNumber(value: number)) ?? ""
        }
    }
}
