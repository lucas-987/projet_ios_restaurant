//
//  GFError.swift
//  projet_ios_restaurant
//
//  Created by nassih afaf on 08/02/2021.
//

import Foundation
enum GFError: String, Error {
    case invalidId = "Invalid id"
    case unableToComplete = "Unable to complete your request"
    case invalidResponse = "Invalid response from the server"
    case invalidData = "Invalid data recieved from the server"
}
