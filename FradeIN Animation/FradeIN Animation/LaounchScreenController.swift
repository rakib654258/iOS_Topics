//
//  LaounchScreenVC.swift
//  FradeIN Animation
//
//  Created by Rakib Hasan on 29/9/19.
//  Copyright © 2019 Rakib Hasan. All rights reserved.
//

import UIKit

class LaounchScreenController: UIViewController {

    @IBOutlet weak var TitleLbl: UILabel!
    @IBOutlet weak var logoOutlet: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        TitleLbl.alpha = 0
        logoOutlet.alpha = 0
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //FadeIn animation
        UIView.animate(withDuration: 3.0, animations: {
            self.TitleLbl.alpha = 1
            self.logoOutlet.alpha = 1
        }) { (true) in

            //UP to Down animation
                    UIView.animate(withDuration: 2.0, animations: {
                        self.logoOutlet.transform = CGAffineTransform(translationX: 0, y: self.view.bounds.size.height)
                        self.TitleLbl.transform = CGAffineTransform(translationX: 0, y: self.view.bounds.size.height)
                        self.view.backgroundColor = UIColor.white
                    }) { (true) in
                        let sb = UIStoryboard(name: "Main", bundle: nil)
                        let vc = sb.instantiateViewController(withIdentifier: "MainStoryBoard")
                        UIApplication.shared.keyWindow?.rootViewController = vc
            
                    }
            
            
        }
        
    }
    
}
