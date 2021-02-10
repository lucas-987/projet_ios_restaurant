//
//  HomeViewController.swift
//  projet_ios_restaurant
//
//  Created by treyer lucas on 01/02/2021.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate {

    var dishes: [Dish] = []
    
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
        configureTableView()
        getDishes()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
    }
    
    func configureTableView() {
        tableView = UITableView()
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeDishCell.self, forCellReuseIdentifier: "HomeDishCell")
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    func getDishes() {
        dishes = [
            Dish(id: 1, name: "dish 1", description: "dont know", price: 10.0, calories: 500, proteins: "prot", carbs: "carbs", imageUrl: "https://artgalleryofballarat.com.au/wp-content/uploads/2020/06/placeholder-image-768x576.png"),
            Dish(id: 2, name: "dish 2", description: "dont know", price: 5.0, calories: 500, proteins: "prot", carbs: "carbs", imageUrl: ""),
            Dish(id: 3, name: "dish 3", description: "dont know", price: 13.25, calories: 500, proteins: "prot", carbs: "carbs", imageUrl: ""),
            Dish(id: 4, name: "dish 4", description: "dont know", price: 9.80, calories: 500, proteins: "prot", carbs: "carbs", imageUrl: ""),
            Dish(id: 5, name: "dish 5", description: "dont know", price: 7.5, calories: 500, proteins: "prot", carbs: "carbs", imageUrl: ""),
        ]
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

extension HomeViewController: UITabBarDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeDishCell", for: indexPath) as! HomeDishCell
        
        let dish = dishes[indexPath.row]
        
        cell.set(dish: dish)
        
        return cell 
    }
    
    //cell clicked
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dish = dishes[indexPath.row]
        let detailsVC = HomeDishDetailsVC(dish: dish)
        
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
}
