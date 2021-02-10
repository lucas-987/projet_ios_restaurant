//
//  profilVC.swift
//  projet_ios_restaurant
//
//  Created by nassih afaf on 01/02/2021.
//

import UIKit
class profilVC: UIViewController {
    
    var users : ProfilObj?
    
    @IBOutlet weak var UserFName: UITextField!
    @IBOutlet weak var UserLName: UITextField!
    @IBOutlet weak var UserEmail: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let monUser = users{
            UserFName.text = monUser.firstName
            UserLName.text = monUser.lastName
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        users?.firstName = UserFName.text!
        users?.lastName = UserLName.text!
    }
}
