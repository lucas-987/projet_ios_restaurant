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
    @IBOutlet weak var UserBirthDate: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //getUser(userId: "ID") // TODO mettre un id valid
        
    }
    
    func getUser(userId: String){
        NetworkManager.shared.getUser(for: userId) { result in
            switch result {
            case .success(let users):
                //remplir ma table view avec le tableau followr que la fonction getusers(celle dans networkmANAGER) nous retourne
                self.users = users
                DispatchQueue.main.async {
                    //self.tableView.reloadData()
                }
                
            case .failure(let error):
                let alert = GFAlert(title: "Oups", message: error.rawValue)
                DispatchQueue.main.async {
                    alert.showAlert(on: self)
                }
            }
            
        }
    }
    
    
    @IBAction func buttonSaveClicked(_ sender: UIButton) {
        
        let lastName = UserLName.text
        let firstName = UserFName.text
        let email = UserEmail.text
        
        let dateFormatter = DateFormatter()
        let birthDate = dateFormatter.string(from: UserBirthDate.date)
        
        // TODO utiliser ces données pour faire la requête en post
        
    }
}


