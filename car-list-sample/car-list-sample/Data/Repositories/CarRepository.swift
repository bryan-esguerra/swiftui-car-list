//
//  CarRepository.swift
//  car-list-sample
//
//  Created by Robert Bryan Esguerra on 17/4/24.
//

import Foundation

class CarRepository {
    private let carDataService: CarCoreDataService
    private let jsonFileName: String

    init(carDataService: CarCoreDataService, jsonFileName: String) {
        self.carDataService = carDataService
        self.jsonFileName = jsonFileName
    }

    func getCars(completion: @escaping ([CarDto]) -> Void) {
        if let carsFromCoreData = carDataService.loadAllCars(), !carsFromCoreData.isEmpty {
            completion(carsFromCoreData)
        } else {
            loadCarsFromJSON(completion: completion)
        }
    }

    private func saveCars(cars: [CarDto]) {
        carDataService.addCarsFromList(carDto: cars)
    }

    private func loadCarsFromJSON(completion: @escaping ([CarDto]) -> Void) {
        guard let url = Bundle.main.url(forResource: jsonFileName, withExtension: "json") else {
            print("JSON file not found")
            completion([])
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let cars = try decoder.decode([CarDto].self, from: data)
            saveCars(cars: cars)
            completion(cars)
        } catch {
            print("Error decoding JSON: \(error)")
            completion([])
        }
    }
}
