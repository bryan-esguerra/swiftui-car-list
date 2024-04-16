//
//  HomeView.swift
//  car-list-sample
//
//  Created by Robert Bryan Esguerra on 16/4/24.
//

import SwiftUI

struct HomeView: View {
    let coreDataService = CarCoreDataService()
    @State private var viewModel: CarListViewModel

    init() {
        let carRepository = CarRepository(carDataService: coreDataService, jsonFileName: "car_list")
        viewModel = CarListViewModel(carRepository: carRepository)
    }

    var body: some View {
        CarListView(viewModel: viewModel)
            .onAppear {
                viewModel.fetchCars()
            }
    }
}
