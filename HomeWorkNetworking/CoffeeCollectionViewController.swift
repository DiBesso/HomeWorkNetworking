//
//  CoffeeCollectionViewController.swift
//  HomeWorkNetworking
//
//  Created by Дмитрий Бессонов on 15.01.2022.
//

import UIKit


class CoffeeCollectionViewController: UICollectionViewController {

    let itemsRow: CGFloat = 2
    let sectionInsets = UIEdgeInsets (top: 20, left: 20, bottom: 20, right: 20)
    
    var coffees: [Coffee] = []
    var randomPhoto = "https://coffee.alexflipnote.dev/random.json"
    

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
 
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "coffeeCell", for: indexPath) as! CoffeeCell
//        NetworkingManager.shared.fetchImage(url: randomPhoto) { coffee in cell.configure(with: coffee)
//        }

        return cell
    }

}

extension CoffeeCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingWidth = sectionInsets.left * (itemsRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthItem = availableWidth / itemsRow
        return CGSize (width: widthItem, height: widthItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sectionInsets.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sectionInsets.left
    }
}

extension CoffeeCollectionViewController {
    
    
    func fetchCoffee() {
        NetworkingManager.shared.fetchCoffeeWithAlamofire(randomPhoto) { result in
            switch result {
            case .success(let coffee):
                self.coffees = coffee
                self.collectionView.reloadData()
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
//    func fetchImage() {
//        guard let url = URL(string: randomPhoto) else { return }
//
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data else {
//                print(error?.localizedDescription ?? "No error description")
//                return
//            }
//
//            do {
//                _ = try JSONDecoder().decode(Coffee.self, from: data)
//                DispatchQueue.main.async {
//                    self.collectionView.reloadData()
//                }
//            } catch {
//                print(error.localizedDescription)
//            }
//
//        }.resume()
//
//    }
}
