//
//  RewardViewController.swift
//  Renova Puts
//
//  Created by macOS Mojave on 24/5/19.
//  Copyright © 2019 macOS Mojave. All rights reserved.
//

import UIKit

class RewardViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var name = ["Hello","sdfsd","Hello name","you gate 1000","Hello,is Everything ok? Within Reward.","fghgfh"]
    var img = ["boom","new goals","new goals","new goals","new goals","new goals"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! RewardTableViewCell
        // Configure the cell...
        let image = img[indexPath.row]
        cell.imgView.image = UIImage(named: image)
        cell.nameView.text = name[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    


}
