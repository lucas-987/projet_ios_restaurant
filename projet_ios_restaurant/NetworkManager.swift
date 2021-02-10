//
//  NetworkManager.swift
//  projet_ios_restaurant
//
//  Created by nassih afaf on 08/02/2021.
//

import UIKit

class NetworkManager {
    //s'assurer que cette classe ne s'instencie qu'une seule fois
    static let shared = NetworkManager()
    let baseURL = "http://193.70.115.114:8080/"
    let cache = NSCache<NSString, UIImage>() //chaine de caractere pour identifier l'url de l'image et l'image en elle meme
     
    
       
    private init(){
        
        
    }
    
    func getUser(for username: String, completed: @escaping (Result<[ProfilObj], GFError>) -> Void) {
        //l'url en string
        let endpoint = baseURL + "\(username)/Costumer"
        //print(endpoint)
        //convertir endpoint recuperer en URL
        //on verifie avec guard si l'url est correct avec la fonction URL on lui passe en param notre endpoint
        guard let url = URL(string: endpoint) else{
            //la il est bien correct on peut traiter
            completed(.failure(.invalidUsername))
            return
            //il retourne nil parce que y'a pas de username a ce nom donc notre tableau de follower sera vide
            
        }
        //fonction la requete qui envoie la requete au serveur est le code continue a s'exec
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }//verifier s'il return du data c'est a dire un code de 200
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                //si le http different de 200
                 completed(.failure(.invalidResponse))
                 return
            }
            //maintenant qu'on a verifier qu'il y'a pas d'erreur est qu'on a bien reçu du data grace a la verification guard (code http 200)
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            //la on a bien notre data en jason on doit la decoder
            do{
                let decoder = JSONDecoder ()
                decoder.keyDecodingStrategy = .convertFromSnakeCase //prend pas les maj en compte
                //on decode les data qu'on a recup en tableau Follower
                let user = try decoder.decode([ProfilObj].self, from: data)
                    completed(.success(user))
            }catch {
                    completed(.failure(.invalidData))
            }
        }
       
        task.resume()
        
       
    }

}
