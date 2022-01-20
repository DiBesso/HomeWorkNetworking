//
//  CoffeeCell.swift
//  HomeWorkNetworking
//
//  Created by Дмитрий Бессонов on 15.01.2022.
//

import UIKit

class CoffeeCell: UICollectionViewCell {
    
    
    @IBOutlet weak var coffeeImageView: UIImageView!
    

    func configure(with coffees: Coffee ) {
        NetworkingManager.shared.fetchImage(from: coffees.file) { result in
            switch result {
            case .success(let imageData):
                self.coffeeImageView.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
            
//    DispatchQueue.global().async {
//        guard let url = URL(string: coffees.file ?? "Error") else { return }
//        guard let imageData = try? Data(contentsOf: url) else { return }
//
//        DispatchQueue.main.async {
//            self.coffeeImageView.image = UIImage(data: imageData)
        }
    }
}
