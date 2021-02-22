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
        if(self.dishes.isEmpty){ self.orderButton.isEnabled = false }
        tableView.rowHeight = 100
        tableView.reloadData()
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
        if dish.imageUrl != "" { cell.dishImage.image = UIImage(named: "NoImage") }
        else { cell.dishImage.image = UIImage(named: "NoImage") }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            OrdersManager.shared.removeOrderedDish(index: indexPath.row)
            self.dishes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

    @IBAction func orderButtonPressed(_ sender: Any) {
        print("Envoi de la commande au serveur")
        order()
    }
    
    func order() {
        
        var dishesId = [Any]()
        for dish in dishes { dishesId.append(dish.id) }
        let json = ["idCustomer": 1, "idDishes": dishesId] as [String : Any]
        
        let urlString = "http://193.70.115.114/resto/order/add"
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            print("Passage async")
            /*if let _ = error {
                print("error")
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("response")
                return
            }
            guard let data = data else {
                print("data")
                return
            }*/
            print("Des frites oune foué lô")
            self.dishes = []
            OrdersManager.shared.deleteOrderedDishes()
            DispatchQueue.main.async {
                self.orderButton.isEnabled = false
                self.tableView.reloadData()
            }
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
}
