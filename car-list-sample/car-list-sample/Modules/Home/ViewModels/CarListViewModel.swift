//
//  CarListViewModel.swift
//  car-list-sample
//
//  Created by Robert Bryan Esguerra on 16/4/24.
//

import Combine
import Foundation

class CarListViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    @Published var cars: [CarDto] = []

    func fetchCars() {
        guard let url = Bundle.main.url(forResource: "car_list", withExtension: "json") else {
            print("JSON file not found")
            return
        }

        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [CarDto].self, decoder: JSONDecoder())
            .sink { completion in
                switch completion {
                case .finished:
                    print("JSON decoding finished")
                case let .failure(error):
                    print("Failed to decode JSON: \(error)")
                }
            } receiveValue: { [weak self] cars in
                DispatchQueue.main.async {
                    self?.cars = cars
                }
            }
            .store(in: &cancellables)
    }
}
