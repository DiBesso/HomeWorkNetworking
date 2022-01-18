//
//  NetworkingManager.swift
//  HomeWorkNetworking
//
//  Created by Дмитрий Бессонов on 15.01.2022.
//

import Foundation
import UIKit

class NetworkingManager {
    static var shared = NetworkingManager()
    private init() {}
    
    func fetchImage(url: String, complition: @escaping(_ coffee: Coffee) -> Void) {
        guard let url = URL(string: CoffeeCollectionViewController().randomPhoto) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
        //guard let image = UIImage(data: data) else { return }
            let decoder = JSONDecoder()
        
            do {
                let coffee = try decoder.decode(Coffee.self, from: data)
            
            DispatchQueue.main.async {
                complition(coffee)
            }
            } catch {
                print(error)
            }
        }.resume()
        }
    }



