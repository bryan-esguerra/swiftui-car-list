//
//  CarListView.swift
//  car-list-sample
//
//  Created by Robert Bryan Esguerra on 16/4/24.
//

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
