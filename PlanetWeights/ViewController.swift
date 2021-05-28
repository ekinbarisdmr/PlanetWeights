//
//  ViewController.swift
//  PlanetWeights
//
//  Created by Ekin Barış Demir on 23.05.2021.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, SendValues, SendSeledtedPlanet {
    
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var views = [UIView]()
    var age = ""
    var weight = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        views = createViews()
        setupScrollView(views: views)
        scrollView.delegate = self
        
        view.backgroundColor = .clear
        
        pageControl.numberOfPages = views.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
        
        
    }
    
    func createViews() -> [UIView] {
        
        let views1:Main = Bundle.main.loadNibNamed("Main", owner: self, options: nil)?.first as! Main
        views1.setups()
        views1.delegate = self
        views.append(views1)
        
        
        let views2:Planets = Bundle.main.loadNibNamed("Planets", owner: self, options: nil)?.first as! Planets
        views2.setupCollectionView()
        views2.delegate = self
        views.append(views2)
        
        
        return [views1, views2]
    }
    
    
    func setupScrollView(views : [UIView]) {
        
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(views.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        
        
        for i in 0..<views.count{
            
            views[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(views[i])
            
        }
        
        
    }
    
    func selected(planet: Planets.SelectedPlanet) {
        
        
        switch planet {
            case .mars:
                weight = "\(Double(weight)! * 0.166)"
                age = "\(Double(age)! * 0.531)"
                
            case .earth:
                weight = "\(Double(weight)! * 1)"
                age = "\(Double(age)! * 1)"
                
            case.jupiter:
                weight = "\(Double(weight)! * 2.375)"
                age = "\(Double(age)! * 0.083)"
                
            case.mercury:
                weight = "\(Double(weight)! * 0.377)"
                age = "\(Double(age)! * 4.147)"
                
            case.moon:
                weight = "\(Double(weight)! * 0.166)"
                age = "\(Double(age)! * 1.03)"
                
            case.neptune:
                weight = "\(Double(weight)! * 1.121)"
                age = "\(Double(age)! * 0.006)"
                
            case.saturn:
                weight = "\(Double(weight)! * 0.937)"
                age = "\(Double(age)! * 0.03)"
                
            case.uranus:
                weight = "\(Double(weight)! * 0.885)"
                age = "\(Double(age)! * 0.011)"
                
            case.venus:
                weight = "\(Double(weight)! * 0.904)"
                age = "\(Double(age)! * 1.622)"
                
                default:
                break
        }
        
        
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        if let vc = mainStoryboard.instantiateViewController(identifier: "ResultViewController") as? ResultViewController {
            
            vc.age = age
            vc.weight = weight
            print(weight)
            print(age)
            
            self.present(vc, animated: true, completion: nil)
            
            
        }
    }
    
    func values(weight: String, age: String) {
        
        self.age = age
        self.weight = weight
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
        pageControl.currentPage = Int(floorf(Float(scrollView.contentOffset.x / scrollView.frame.size.width)))
        
    }
    
    
    
}

