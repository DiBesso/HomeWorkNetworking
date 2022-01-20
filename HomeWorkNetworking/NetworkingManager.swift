//
//  NetworkingManager.swift
//  HomeWorkNetworking
//
//  Created by Дмитрий Бессонов on 15.01.2022.
//

import Foundation
import Alamofire

class NetworkingManager {
    static var shared = NetworkingManager()
    private init() {}
    
    func fetchImage(from url: String?, completion: @escaping(Result<Data, Error>) -> Void) {
        guard let url = URL(string: url ?? "") else {
            completion(.failure(Error.self as! Error))
            return
        }
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else {
                completion(.failure(Error.self as! Error))
                return
            }
            DispatchQueue.main.async {
                completion(.success(imageData))
            }
        }
    }
    
    func fetchCoffeeWithAlamofire (_ url: String, completion: @escaping(Result<[Coffee], Error>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let courses = Coffee.getCoffee(from: value)
                    completion(.success(courses))
                case .failure:
                    completion(.failure(Error.self as! Error))
                }
            }
    }
    
//    func fetchImage(url: String, complition: @escaping(_ coffee: Coffee) -> Void) {
//        guard let url = URL(string: CoffeeCollectionViewController().randomPhoto) else { return }
//
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data else {
//                print(error?.localizedDescription ?? "No error description")
//                return
//            }
//        //guard let image = UIImage(data: data) else { return }
//            let decoder = JSONDecoder()
//
//            do {
//                let coffee = try decoder.decode(Coffee.self, from: data)
//
//            DispatchQueue.main.async {
//                complition(coffee)
//            }
//            } catch {
//                print(error)
//            }
//        }.resume()
//        }
    }



