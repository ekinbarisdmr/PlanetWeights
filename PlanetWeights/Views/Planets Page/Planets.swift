//
//  Planets.swift
//  PlanetWeights
//
//  Created by Ekin Barış Demir on 23.05.2021.
//

import UIKit
import Foundation


protocol SendSeledtedPlanet {
    func selected(planet: Planets.SelectedPlanet)
}

class Planets: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var collectionView: UICollectionView! = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
    
    let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    
    var planets = ["Earth","Jupiter","Mars",
                   "Moon","Mercury","Neptune",
                   "Venus","Uranus","Saturn"]
    
    
    var delegate: SendSeledtedPlanet?
    var weight = ""
    var age = ""
    var selectedPlanet: SelectedPlanet?
    
    
    enum SelectedPlanet: String, CaseIterable {
        case earth = "Earth"
        case jupiter = "Jupiter"
        case mars = "Mars"
        case moon = "Moon"
        case mercury = "Mercury"
        case neptune = "Neptune"
        case venus = "Venus"
        case uranus = "Uranus"
        case saturn = "Saturn"
        
    }
    
    
    func setupCollectionView() {
        
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "planetCell")
        layout.scrollDirection = .vertical
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.alwaysBounceVertical = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.layer.cornerRadius = 10
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        imageView.image = UIImage(named: "space5")
        
    }
    
    
}

extension Planets: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width - 42) / 3  , height: (collectionView.frame.size.width - 42) / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
}

extension Planets: UICollectionViewDelegate {
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // selectedPlanet = Planets.SelectedPlanet(rawValue: planets[indexPath.row]) **
        
        for planet in SelectedPlanet.allCases {
            if planet.rawValue == planets[indexPath.row] {
                selectedPlanet = planet
            }
        }
        delegate?.selected(planet: selectedPlanet!)
   
    }
    
    
}

extension Planets: UICollectionViewDataSource {
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return planets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "planetCell", for: indexPath) as! CollectionViewCell
        
        
        cell.planetImage.image = UIImage(named: "\(planets[indexPath.row])")
        cell.planetImage.layer.cornerRadius = cell.planetImage.frame.size.height / 2
        
        cell.planetName.text = "\(planets[indexPath.row])"
        
        return cell
    }
    
    
    
    
}
