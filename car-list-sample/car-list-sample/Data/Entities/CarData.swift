//
//  CarData.swift
//  car-list-sample
//
//  Created by Robert Bryan Esguerra on 17/4/24.
//

struct CarData: Equatable, Identifiable {
    typealias Identifier = String

    let id: Identifier
    let make: String?
    let model: String?
    let customerPrice: Double?
    let marketPrice: Double?
    let rating: Int16
    let pros: [String]
    let cons: [String]
}
