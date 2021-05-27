//
//  Main.swift
//  PlanetWeights
//
//  Created by Ekin Barış Demir on 23.05.2021.
//

import UIKit

protocol SendValues {
    func values(weight:String, age: String)
}

class Main: UIView, UITableViewDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var ageSlider: UISlider!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var weightLabel: UILabel!
    
    var delegate: SendValues?
    
    var age = ""
    var weight = ""
    
    
   
    
    func setups() {
        imageView.image = UIImage(named: "space")
        colorView.backgroundColor = .lightGray
        colorView.roundCorners(corners: [.topLeft, .topRight], radius: 40)
        colorView.alpha = 0.4
        ageLabel.font = UIFont(name: "Chalkduster", size: 30.0)
        weightLabel.font = UIFont(name: "Chalkduster", size: 30.0)
        
    }
    
    @IBAction func ageSlider(_ sender: UISlider) {
        if sender == ageSlider {
            ageLabel.text = "Age : \(Int(ageSlider.value))"
            age = "\(Int(ageSlider.value))"
        }
        else if sender == weightSlider {
            weightLabel.text = "Weight : \(Int(weightSlider.value))"
            weight = "\(Int(weightSlider.value))"

        }
        
        delegate?.values(weight: weight, age: age)
        
    }
    
    
    
    
    
    
}






