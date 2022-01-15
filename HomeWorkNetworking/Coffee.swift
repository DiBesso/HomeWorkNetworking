//
//  Coffee.swift
//  HomeWorkNetworking
//
//  Created by Дмитрий Бессонов on 15.01.2022.
//

import Foundation

struct Coffee: Decodable {
    var file: String?
}

struct Link: Decodable {
    var randomPhoto: String = "https://coffee.alexflipnote.dev/random.json"
}
