//
//  profilVC.swift
//  projet_ios_restaurant
//
//  Created by nassih afaf on 01/02/2021.
//

import UIKit
class profilVC: UIViewController {
    
    var user : ProfilObj?
    
    
    @IBOutlet weak var UserFName: UITextField!
    @IBOutlet weak var UserLName: UITextField!
    @IBOutlet weak var UserEmail: UITextField!
    @IBOutlet weak var UserBirthDate: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUser(userId: "2") // TODO mettre un id valid
        
    }
    
    @IBAction func firstNameChanged(_ sender: UITextField) {
        
    }
    
    @IBAction func lastNameChanged(_ sender: UITextField) {
    }
    
    @IBAction func emailChanged(_ sender: UITextField) {
    }
    
    
    
    func getUser(userId: String){
        NetworkManager.shared.getUser(for: userId) { result in
            switch result {
            case .success(let user):
                //remplir ma table view avec le tableau  que la fonction getuser(celle dans networkmANAGER) nous retourne
                
                DispatchQueue.main.async {
                    self.user = user
                    self.UserFName.text = user.firstName
                    self.UserLName.text = user.lastName
                    self.UserEmail.text = user.email
                    
                    //let dateFormatter = DateFormatter()
                    
                    //self.UserBirthDate.date = dateFormatter.date(from: user.dateOfBirth)!
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
        
        let lastName = UserLName.text!
        let firstName = UserFName.text!
        let email = UserEmail.text!
        
        let dateFormatter = DateFormatter()
        let birthDate = dateFormatter.string(from: UserBirthDate.date)
        
        //  TODO utiliser ces données pour faire la requête en post
        NetworkManager.shared.modifyuser(userId: String(user!.id), lastName: lastName, firstname: firstName, email: email, birthDate: birthDate) { result in
            switch result {
            case .success(let user):
                print("ok")
            case .failure(let error):
                let alert = GFAlert(title: "Oups", message: error.rawValue)
                DispatchQueue.main.async {
                    alert.showAlert(on: self)
                }
            }
            
        }
    }
}


