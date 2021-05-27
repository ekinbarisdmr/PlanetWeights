//
//  ResultViewController.swift
//  PlanetWeights
//
//  Created by Ekin Barış Demir on 25.05.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var ageName: UILabel!
    @IBOutlet weak var weightName: UILabel!
    @IBOutlet weak var weightView: UIView!
    @IBOutlet weak var ageView: UIView!
    @IBOutlet weak var backButton: UIButton!
    
    var age = ""
    var weight = ""
    var planetName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.layer.cornerRadius = 12
        weightView.layer.cornerRadius = 20
        ageView.layer.cornerRadius = 20
        
        
        if let age = Double(age), let weight = Double(weight) {
            let ageValue = String(format:"%.4f", age)
            let weightValue = String(format:"%.4f", weight)
            ageLabel.text = "\(ageValue) Years"
            weightLabel.text = "\(weightValue) Kg"
        }
        
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
    
}


