//
//  HomePageView.swift
//  CovidGlobalTracker
//
//  Created by Liiban Mukhtar on 22/08/2020.
//  Copyright © 2020 Liiban Mukhtar. All rights reserved.
//

import UIKit

class HomePageView: UIViewController {
    
    
    @IBOutlet weak var continueButton: UIButton!{
        didSet{
            continueButton.layer.cornerRadius = 12
            
        }
    }
    
    @IBOutlet weak var worldImage: UIImageView!{
        didSet{
           let hover = CABasicAnimation(keyPath: "position")
               
           hover.isAdditive = true
           hover.fromValue = NSValue(cgPoint: CGPoint.zero)
           hover.toValue = NSValue(cgPoint: CGPoint(x: 0.0, y: 30))
           hover.autoreverses = true
           hover.duration = 1
           hover.repeatCount = Float.infinity
           worldImage.layer.add(hover, forKey: "myHoverAnimation")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }
        // Do any additional setup after loading the view.
    
    @IBAction func continueButtonPressed(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "MainTabBar", bundle: nil)
        let balanceViewController = storyBoard.instantiateViewController(withIdentifier: "MainTabBar") as! MainTabBarViewController
        self.present(balanceViewController, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}



