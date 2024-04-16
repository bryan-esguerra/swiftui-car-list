//
//  CarListViewModel.swift
//  car-list-sample
//
//  Created by Robert Bryan Esguerra on 16/4/24.
//

import Combine
import Foundation

class CarListViewModel: ObservableObject {
    private let carRepository: CarRepository
    private var cancellables = Set<AnyCancellable>()
    @Published var cars: [CarDto] = []
    @Published var filteredCars: [CarDto] = []
    var availableMakes: [String] = []
    var availableModels: [String] = []
    let defaultMaker = "Any make"
    let defaultModel = "Any model"

    @Published var selectedMake: String {
        didSet {
            filterCars()
        }
    }

    @Published var selectedModel: String {
        didSet {
            filterCars()
        }
    }

    init(carRepository: CarRepository) {
        self.carRepository = carRepository
        selectedMake = defaultMaker
        selectedModel = defaultModel
        fetchCars()
    }

    func fetchCars() {
        carRepository.getCars { cars in
            DispatchQueue.main.async {
                self.cars = cars
                self.filteredCars = cars
                self.updateAvailableMakesAndModels(from: cars)
            }
        }
    }

//    func fetchCars() {
//        guard let url = Bundle.main.url(forResource: "car_list", withExtension: "json") else {
//            print("JSON file not found")
//            return
//        }
//
//        URLSession.shared.dataTaskPublisher(for: url)
//            .map { $0.data }
//            .decode(type: [CarDto].self, decoder: JSONDecoder())
//            .sink { completion in
//                switch completion {
//                case .finished:
//                    print("JSON decoding finished")
//                case let .failure(error):
//                    print("Failed to decode JSON: \(error)")
//                }
//            } receiveValue: { [weak self] cars in
//                DispatchQueue.main.async {
//                    self?.cars = cars
//                    self?.filteredCars = cars
//                    self?.updateAvailableMakesAndModels(from: cars)
//                }
//            }
//            .store(in: &cancellables)
//    }

    private func updateAvailableMakesAndModels(from cars: [CarDto]) {
        availableMakes = [defaultMaker] + Array(Set(cars.compactMap { $0.make }))
        availableModels = [defaultModel] + Array(Set(cars.compactMap { $0.model }))
    }

    private func filterCars() {
        if selectedMake == defaultMaker && selectedModel == defaultModel {
            filteredCars = cars
        } else if selectedMake != defaultMaker && selectedModel != defaultModel {
            filteredCars = cars.filter { $0.make == selectedMake && $0.model == selectedModel }
        } else if selectedMake != defaultMaker {
            filteredCars = cars.filter { $0.make == selectedMake }
        } else if selectedModel != defaultModel {
            filteredCars = cars.filter { $0.model == selectedModel }
        } else {
            filteredCars = cars
        }
    }
}
