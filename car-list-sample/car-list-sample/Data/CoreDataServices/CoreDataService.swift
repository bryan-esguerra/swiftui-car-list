//
//  CoreDataService.swift
//  car-list-sample
//
//  Created by Robert Bryan Esguerra on 17/4/24.
//
import CoreData

class CoreDataService {
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "car_list_sample")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                assertionFailure("CoreDataStorage Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
}
