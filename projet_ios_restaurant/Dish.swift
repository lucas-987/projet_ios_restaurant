//
//  Dish.swift
//  projet_ios_restaurant
//
//  Created by treyer lucas on 25/01/2021.
//

import Foundation

struct Dish : Decodable {
    var id: Int
    var name: String
    var description: String
    var price: String
    var calories: String
    var proteins: String
    var carbs: String
    var imageURL: String
}
