//
//  OrdersViewController.swift
//  projet_ios_restaurant
//
//  Created by vandaele jason on 01/02/2021.
//

import UIKit

class OrdersViewController: UITableViewController {

    var dishes = [Dish]()
    
    override func viewDidLoad() {
        loadDummyDishes()
        super.viewDidLoad()
        tableView.rowHeight = 100
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    func loadDummyDishes() {
        let dishes = [
            Dish(id: 0, name: "Pizza au roquefort", description: "Le roquefort c'est bon.", price: 7.50, calories: 5000, proteins: "500", carbs: "500", imageUrl: "Pas de lien"),
            Dish(id: 1, name: "Entrecôte au poivre", description: "Le poivre c'est bon.", price: 10.50, calories: 5000, proteins: "500", carbs: "500", imageUrl: "Pas de lien"),
            Dish(id: 2, name: "Hamburger épicé", description: "Les épices c'est bon.", price: 6.50, calories: 5000, proteins: "500", carbs: "500", imageUrl: "Pas de lien"),
         ]
        self.dishes = dishes;
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell", for: indexPath) as! OrderTableViewCell
        let dish = dishes[indexPath.row]
        cell.dishName.text = dish.name
        cell.dishPrice.text = "$" + String(format: "%.2f", dish.price)
        cell.dishImage.image = UIImage(named: "NoImage")
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
