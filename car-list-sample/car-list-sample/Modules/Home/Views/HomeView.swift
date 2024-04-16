//
//  HomeView.swift
//  car-list-sample
//
//  Created by Robert Bryan Esguerra on 16/4/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = CarListViewModel()

    var body: some View {
        CarListView(viewModel: viewModel)
            .onAppear {
                viewModel.fetchCars()
            }
    }
}
