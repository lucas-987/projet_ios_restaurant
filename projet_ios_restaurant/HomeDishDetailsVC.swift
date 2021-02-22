//
//  HomeDishDetailsVC.swift
//  projet_ios_restaurant
//
//  Created by treyer lucas on 03/02/2021.
//

import UIKit

class HomeDishDetailsVC: UIViewController {
    
    var dish: Dish
    
    var navigationBar = UINavigationBar()
    var imageView = UIImageView()
    var titleLabel = UILabel()
    var descriptionLabel = UILabel()
    var nutritionLabel = UILabel()
    var orderButton = UIButton()
    
    init(dish: Dish) {
        self.dish = dish
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(titleLabel)
        view.addSubview(orderButton)
        view.addSubview(descriptionLabel)
        view.addSubview(nutritionLabel)
        
        configureVC()
        configureTitle()
        configureImageView()
        configuredescription()
        configureNutrition()
        configureButton()
    }
    
    func configureVC() {
        view.backgroundColor = .systemBackground
    }
    
    func configureImageView() {
        
    }
    
    func configureTitle() {
        titleLabel.text = dish.name
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func configuredescription() {
        descriptionLabel.text = dish.description
        descriptionLabel.textAlignment = .center
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.centerYAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    func configureNutrition() {
        nutritionLabel.text = "Calories: " + String(dish.calories) + " - Carbs: " + String(dish.carbs) + " - Proteins: " + String(dish.proteins)
        nutritionLabel.textAlignment = .center
        
        nutritionLabel.translatesAutoresizingMaskIntoConstraints = false
        nutritionLabel.centerYAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 50).isActive = true
        nutritionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        nutritionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    func configureButton() {
        orderButton.addTarget(self, action: #selector(self.orderButtonClicked(_:)), for: .touchUpInside)
        
        orderButton.translatesAutoresizingMaskIntoConstraints = false
        orderButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        //orderButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        //orderButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        //orderButton.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 80).isActive = true
        orderButton.centerYAnchor.constraint(equalTo: view.bottomAnchor, constant: -180).isActive = true
        orderButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        orderButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        orderButton.backgroundColor = .systemGreen
        orderButton.layer.cornerRadius = 10
        orderButton.setTitle("$" + String(dish.price) + " - " + "Add to order", for: .normal)
        orderButton.titleLabel!.font = UIFont.systemFont(ofSize: 22)
    }
    
    @objc func orderButtonClicked(_ sender: UIButton) {
        // TODO store order into orderlist singleton
        navigationController?.popViewController(animated: true)
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
