//
//  CarRepository.swift
//  car-list-sample
//
//  Created by Robert Bryan Esguerra on 17/4/24.
//

import Combine
import Foundation

class CarRepository {
    private let carDataService: CarCoreDataService
    private let jsonFileName: String

    init(carDataService: CarCoreDataService, jsonFileName: String) {
        self.carDataService = carDataService
        self.jsonFileName = jsonFileName
    }

    func getCars() -> AnyPublisher<[CarDto], Error> {
        if let carsFromCoreData = carDataService.loadAllCars(), !carsFromCoreData.isEmpty {
            return Just(carsFromCoreData)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        } else {
            return loadCarsFromJSON()
                .eraseToAnyPublisher()
        }
    }

    private func loadCarsFromJSON() -> AnyPublisher<[CarDto], Error> {
        guard let url = Bundle.main.url(forResource: jsonFileName, withExtension: "json") else {
            return Fail(error: NSError(domain: "", code: 404, userInfo: nil))
                .eraseToAnyPublisher()
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            return try Just(decoder.decode([CarDto].self, from: data))
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        } catch {
            return Fail(error: error)
                .eraseToAnyPublisher()
        }
    }

    func saveCars(cars: [CarDto]) {
        carDataService.addCarsFromList(carDto: cars)
    }
}
