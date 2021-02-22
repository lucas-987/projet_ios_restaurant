//
//  OrdersManager.swift
//  projet_ios_restaurant
//
//  Created by vandaele jason on 08/02/2021.
//

import UIKit

class OrdersManager {
    
    static let shared = OrdersManager()
    var orderedDishes = [Dish]()
    
    private init(){}
    
    func getOrderedDishes()-> [Dish] { return self.orderedDishes }
    func addOrderedDish(dish: Dish){ self.orderedDishes.append(dish) }
    func removeOrderedDish(index: Int){ self.orderedDishes.remove(at: index) }
    func deleteOrderedDishes(){ self.orderedDishes = [] }
    
    func getDummyDishes()-> [Dish] {
        let dishes = [
            Dish(id: 3, name: "JnaLQN3Cg5", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ipsum augue, mollis sed risus at, congue sagittis tellus. Quisque lacinia neque ipsum, eget laoreet nisi condimentum non. Nulla eget tellus rhoncus, feugiat velit et, cursus mi. Ut et maximus odio, vel efficitur velit. Suspendisse commodo convallis ultrices. Fusce sit amet elit felis. Maecenas vel posuere tellus. Sed nunc magna, semper at tortor rutrum, rutrum egestas leo. Phasellus ipsum lacus, pretium ultrices scelerisque in, tincidunt vitae quam. Etiam sit amet nunc vel justo ultrices suscipit. Cras aliquam ullamcorper condimentum. Proin id lacus justo.", price: 3.65, calories: 1744, proteins: "3", carbs: "0", imageUrl: "https://i1.wp.com/www.eatthis.com/wp-content/uploads/2020/10/applebees-salmon.jpg?resize=1024%2C750&ssl=1"),
            Dish(id: 4, name: "zuSb7Nw6O5", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ipsum augue, mollis sed risus at, congue sagittis tellus. Quisque lacinia neque ipsum, eget laoreet nisi condimentum non. Nulla eget tellus rhoncus, feugiat velit et, cursus mi. Ut et maximus odio, vel efficitur velit. Suspendisse commodo convallis ultrices. Fusce sit amet elit felis. Maecenas vel posuere tellus. Sed nunc magna, semper at tortor rutrum, rutrum egestas leo. Phasellus ipsum lacus, pretium ultrices scelerisque in, tincidunt vitae quam. Etiam sit amet nunc vel justo ultrices suscipit. Cras aliquam ullamcorper condimentum. Proin id lacus justo.", price: 0.4, calories: 1994, proteins: "5", carbs: "0", imageUrl: "https://i1.wp.com/www.eatthis.com/wp-content/uploads/2019/08/panda-express-beef-and-broccoli.jpg?resize=1024%2C750&ssl=1"),
            Dish(id: 5, name: "MYNKB76lYP", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ipsum augue, mollis sed risus at, congue sagittis tellus. Quisque lacinia neque ipsum, eget laoreet nisi condimentum non. Nulla eget tellus rhoncus, feugiat velit et, cursus mi. Ut et maximus odio, vel efficitur velit. Suspendisse commodo convallis ultrices. Fusce sit amet elit felis. Maecenas vel posuere tellus. Sed nunc magna, semper at tortor rutrum, rutrum egestas leo. Phasellus ipsum lacus, pretium ultrices scelerisque in, tincidunt vitae quam. Etiam sit amet nunc vel justo ultrices suscipit. Cras aliquam ullamcorper condimentum. Proin id lacus justo.", price: 5.59, calories: 842, proteins: "500", carbs: "500", imageUrl: "https://i1.wp.com/www.eatthis.com/wp-content/uploads/2017/09/pf-changs-buddhas-feast.jpg?resize=1024%2C750&ssl=1"),
         ]
        return dishes
    }
}

