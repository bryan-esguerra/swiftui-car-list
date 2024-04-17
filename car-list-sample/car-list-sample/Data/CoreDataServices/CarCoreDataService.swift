//
//  CarCoreDataService.swift
//  car-list-sample
//
//  Created by Robert Bryan Esguerra on 17/4/24.
//
import CoreData
import UIKit

final class CarCoreDataService: CoreDataService {
    private let entityName = "Car"

    func addCarsFromList(carDto: [CarDto]) {
        if !carDto.isEmpty {
            deleteCars()
            for car in carDto {
                addCar(carDto: car)
            }
        }
    }

    func addCar(carDto: CarDto) {
        let context = persistentContainer.viewContext
        let entity = NSEntityDescription.insertNewObject(forEntityName: entityName, into: context)
        entity.setValue(carDto.make, forKeyPath: "make")
        entity.setValue(carDto.model, forKeyPath: "model")
        entity.setValue(carDto.customerPrice, forKeyPath: "customerPrice")
        entity.setValue(carDto.marketPrice, forKeyPath: "marketPrice")
        entity.setValue(carDto.rating, forKeyPath: "rating")
        entity.setValue(carDto.prosList.joined(separator: ",,,"), forKeyPath: "pros")
        entity.setValue(carDto.consList.joined(separator: ",,,"), forKeyPath: "cons")

        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }

    func loadAllCars() -> [CarDto]? {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)

        do {
            guard let result = try context.fetch(fetchRequest) as? [NSManagedObject] else { return nil }

            let cars = result.compactMap { object -> CarDto? in
                guard
                    let make = object.value(forKey: "make") as? String,
                    let model = object.value(forKey: "model") as? String,
                    let customerPrice = object.value(forKey: "customerPrice") as? Double,
                    let marketPrice = object.value(forKey: "marketPrice") as? Double,
                    let rating = object.value(forKey: "rating") as? Int16,
                    let pros = object.value(forKey: "pros") as? String,
                    let cons = object.value(forKey: "cons") as? String
                else { return nil }

                return CarDto(
                    make: make,
                    model: model,
                    customerPrice: customerPrice,
                    marketPrice: marketPrice,
                    rating: Int(rating),
                    prosList: pros.isEmpty ? [] : pros.components(separatedBy: ",,,"),
                    consList: cons.isEmpty ? [] : cons.components(separatedBy: ",,,")
                )
            }

            return cars
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return nil
        }
    }

    private func deleteCars() {
        let context = persistentContainer.viewContext
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)

        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch let error as NSError {
            print("Could not delete. \(error), \(error.userInfo)")
        }
    }
}
