//
//  CarDto.swift
//  car-list-sample
//
//  Created by Robert Bryan Esguerra on 16/4/24.
//

import SwiftUI

struct CarDto: Hashable, Codable {
    var make: String?
    var model: String?
    var customerPrice: Double
    var marketPrice: Double
    var rating: Int
    var prosList: [String]
    var consList: [String]
}

extension CarDto {
    func imageForCar() -> UIImage {
        let makeWithoutSpaces = make?.replacingOccurrences(of: " ", with: "")
        let modelWithoutSpaces = model?.replacingOccurrences(of: " ", with: "")
        let key = "\(makeWithoutSpaces ?? "")-\(modelWithoutSpaces ?? "")"

        switch key {
        case "LandRover-RangeRover":
            return Asset.Image.landRoverRangeRover.image
        case "Alpine-Roadster":
            return Asset.Image.alphineRoadster.image
        case "BMW-3300i":
            return Asset.Image.bmw3300i.image
        case "MercedesBenz-GLEcoupe":
            return Asset.Image.mercedesBenzGLEcoupe.image
        default:
            return Asset.Image.mercedesBenzGLEcoupe.image
        }
    }
}
