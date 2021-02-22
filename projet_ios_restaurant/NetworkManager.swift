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
    
    func getUser(for userId: String, completed: @escaping (Result<ProfilObj, GFError>) -> Void) {
        
        let endpoint = baseURL + "/user/\(userId)"
        
        guard let url = URL(string: endpoint) else{
           
            completed(.failure(.invalidId))
            return
           
        }
       
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
              
                completed(.failure(.invalidResponse))
                 return
            }
           
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
             
            do{
                let decoder = JSONDecoder ()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let user = try decoder.decode(ProfilObj.self, from: data)
                    completed(.success(user))
            }catch {
                    completed(.failure(.invalidData))
            }
        }
       
        task.resume()
        
       
    }
    
    func getDishes(completed: @escaping (Result<[Dish], GFError>) -> Void) {
        let endpoint = baseURL + "/dish"
        
        guard let url = URL(string: endpoint) else{
           
            completed(.failure(.invalidId))
            return
           
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
              
                completed(.failure(.invalidResponse))
                return
            }
           
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do{
                let decoder = JSONDecoder ()
                decoder.keyDecodingStrategy = .useDefaultKeys
                let dishes = try decoder.decode([Dish].self, from: data)
                    completed(.success(dishes))
            }catch {
                    completed(.failure(.invalidData))
            }
        }
    }
}
