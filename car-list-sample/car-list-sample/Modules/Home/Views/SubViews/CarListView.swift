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

            FilterView(
                makes: viewModel.availableMakes,
                models: viewModel.availableModels,
                selectedMake: $viewModel.selectedMake,
                selectedModel: $viewModel.selectedModel
            )

            ForEach(Array(viewModel.filteredCars.enumerated()), id: \.element.make) { index, car in
                CarView(car: car, index: index, selectedIndex: $selectedIndex)
                    .padding(.leading, 15)
                    .padding(.trailing, 15)
                    .onTapGesture {
                        withAnimation {
                            if self.selectedIndex == index {
                                self.selectedIndex = nil
                            } else {
                                self.selectedIndex = index
                            }
                        }
                    }
                Spacer()
                LineDivider()
                    .padding(.leading, 25)
                    .padding(.trailing, 25)
            }
        }
        .navigationBarHidden(true)
        .showCustomNavBar()
        .onChange(of: viewModel.filteredCars) { _ in
            selectedIndex = 0
        }
    }
}
