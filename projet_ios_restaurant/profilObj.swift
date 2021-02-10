//
//  profilObj.swift
//  projet_ios_restaurant
//
//  Created by nassih afaf on 01/02/2021.
//

import UIKit



class ProfilObj: NSObject, Decodable{
    //le struct permet de creer directement un constructeur contrairement a une classe
    var firstName: String
    var lastName: String
    var email: String
    var birth: Date
    
    init(firstName: String, lastName: String, birth: Date, email: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.birth = birth
        self.email = email
         
    }
    func setFirstName(firstName:String){
        self.firstName = firstName
    }
    func setLastName(lastName: String){
        self.lastName = lastName
   }
    
}

