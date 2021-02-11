//
//  profilObj.swift
//  projet_ios_restaurant
//
//  Created by nassih afaf on 01/02/2021.
//

import Foundation



struct ProfilObj: Codable {
    //le struct permet de creer directement un constructeur contrairement a une classe
    var id: String
    var firstName:String
    var lastName: String
    var email: String
    var dateOfBirth: Date
    var  extraNapkins: Bool
    var frequentRefill: Bool
    
    
}

