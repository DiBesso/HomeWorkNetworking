//
//  Coffee.swift
//  HomeWorkNetworking
//
//  Created by Дмитрий Бессонов on 15.01.2022.
//

import Foundation

struct Coffee: Decodable {
    var file: String?
    
    init(courseData: [String: Any]) {
        file = courseData["file"] as? String
    }
    
        static func getCoffee(from value: Any) -> [Coffee] {
            guard let coursesData = value as? [[String: Any]] else { return [] }
    
            var coffees = [Coffee]()
    
            for courseData in coursesData {
                let coffee = Coffee(courseData: courseData)
                coffees.append(coffee)
            }
            return coffees
        }
    }

