//
//  OrderTableViewCell.swift
//  projet_ios_restaurant
//
//  Created by vandaele jason on 01/02/2021.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var dishName: UILabel!
    @IBOutlet weak var dishPrice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
