//
//  CarView.swift
//  car-list-sample
//
//  Created by Robert Bryan Esguerra on 16/4/24.
//

import StarRating
import SwiftUI

struct CarView: View {
    let car: CarDto
    let index: Int
    @Binding var selectedIndex: Int?
    @State var customConfig = StarRatingConfiguration(
        spacing: 5,
        numberOfStars: 10,
        minRating: 0,
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

                    VStack(spacing: 2) {
                        DefaultTextStyle(title: "\(car.make ?? "") \(car.model ?? "")",
                                         size: 16,
                                         fontColor: Asset.Color.black45.swiftUIColor,
                                         fontWeight: .w600,
                                         textAlign: .leading)
                            .padding(.leading, 10)
                            .fixedSize(horizontal: false, vertical: true)
                        DefaultTextStyle(title: L10n.List.Price.label(formatNumber(Int(car.customerPrice))),
                                         size: 14,
                                         fontColor: Asset.Color.black45.swiftUIColor,
                                         textAlign: .leading)
                            .padding(.leading, 10)
                            .frame(height: 15)
                        StarRating(initialRating: Double(car.rating), configuration: $customConfig)
                            .frame(height: 15)
                    }
                }

                if self.selectedIndex == index {
                    if !car.prosList.isEmpty && !car.prosList.isEmpty {
                        ProsConsView(title: L10n.List.Pros.label, items: car.prosList)
                    }
                    if !car.consList.isEmpty && !car.consList.isEmpty {
                        ProsConsView(title: L10n.List.Cons.label, items: car.consList)
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
