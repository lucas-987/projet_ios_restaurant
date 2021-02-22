//
//  OrdersViewController.swift
//  projet_ios_restaurant
//
//  Created by vandaele jason on 01/02/2021.
//

import UIKit

class OrdersViewController: UITableViewController {

    @IBOutlet weak var orderButton: UIButton!
    var dishes = [Dish]()
    
    override func viewDidLoad() {
        self.dishes = OrdersManager.shared.getDummyDishes()
        super.viewDidLoad()
        tableView.rowHeight = 100
        tableView.reloadData()
        // Do any additional setup after loading the view.
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

    @IBAction func orderButtonPressed(_ sender: Any) {
        print("Envoi de la commande au serveur")
        order()
    }
    
    func order() {
        var dishesId = [Any]()
        for dish in dishes { dishesId.append([dish.id]) }
        let json = ["ids": dishesId]
        
        let urlString = "http://193.70.115.114/resto/post/1"
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        print(jsonData as Any)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                return
            }
            guard let data = data else {
                return
            }
            self.dishes = []
            OrdersManager.shared.deleteOrderedDishes()
            self.tableView.reloadData()
        }
        task.resume()
        return
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    /*
     {
        [ids : [1,2,3,4]],
        ["id" : 2],
        ["id" : 3],
        ["id" : 4],
        ["id" : 5],
        ["id" : 6]
     }
     
     */
}
