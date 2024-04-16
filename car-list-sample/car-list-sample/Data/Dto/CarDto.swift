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
