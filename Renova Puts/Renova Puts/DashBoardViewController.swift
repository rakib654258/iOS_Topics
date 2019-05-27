//
//  DashBoardViewController.swift
//  Renova Puts
//
//  Created by macOS Mojave on 24/5/19.
//  Copyright © 2019 macOS Mojave. All rights reserved.
//

import UIKit

class DashBoardViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var name = ["Beg", "Renofix5","Shoes"]
    var number = [10.0, 1.0,0.0001]
    @IBOutlet weak var profileView: UIImageView!
    @IBOutlet weak var giftView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        //Rounded image
        profileView.layer.cornerRadius = profileView.frame.size.width / 2
        profileView.clipsToBounds = true
        
        giftView.layer.cornerRadius = giftView.frame.size.width / 2
        giftView.clipsToBounds = true
    
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return name.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! DashBoardCollectionViewCell
        cell.textView.text = name[indexPath.row]
        cell.numberView.text = "\(number[indexPath.row])"
        return cell
    }
    
}
