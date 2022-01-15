//
//  CoffeeCell.swift
//  HomeWorkNetworking
//
//  Created by Дмитрий Бессонов on 15.01.2022.
//

import UIKit

class CoffeeCell: UICollectionViewCell {
    
    
    @IBOutlet weak var coffeeImageView: UIImageView!
    

    func configure() {

    DispatchQueue.global().async {
        guard let url = URL(string: Coffee().file ?? "" ) else { return }
        guard let imageData = try? Data(contentsOf: url) else { return }
        
        DispatchQueue.main.async {
            self.coffeeImageView.image = UIImage(data: imageData)
        }
    }
}
}
