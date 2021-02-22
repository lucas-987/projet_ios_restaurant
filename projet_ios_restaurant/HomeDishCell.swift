//
//  HomeDishCell.swift
//  projet_ios_restaurant
//
//  Created by treyer lucas on 01/02/2021.
//

import UIKit

class HomeDishCell: UITableViewCell {
    
    var titleLabel = UILabel()
    var priceLabel = UILabel()
    var thumbnail = DishThumbnailImageView(frame: .zero)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(thumbnail)
        addSubview(titleLabel)
        addSubview(priceLabel)
        conigureThumbnail()
        configureTitleLabel()
        configurePriceLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(dish: Dish) {
        titleLabel.text = dish.name
        priceLabel.text = String(format: "%.2f", dish.price)
        thumbnail.downloadImage(from: dish.imageUrl)
    }
    
    func configureTitleLabel() {
        
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -5).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: thumbnail.trailingAnchor, constant: 20).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    func configurePriceLabel() {
        
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 15).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: thumbnail.trailingAnchor, constant: 20).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    func conigureThumbnail() {
        thumbnail.layer.cornerRadius = 10
        
        thumbnail.translatesAutoresizingMaskIntoConstraints = false
        thumbnail.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        thumbnail.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        thumbnail.heightAnchor.constraint(equalToConstant: 80).isActive = true
        thumbnail.widthAnchor.constraint(equalTo: thumbnail.heightAnchor).isActive = true
    }
    
}
