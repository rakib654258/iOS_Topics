//
//  ViewController.swift
//  DropDown
//
//  Created by macOS Mojave on 18/9/19.
//  Copyright © 2019 macOS Mojave. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnOutlet: UIButton!
    @IBOutlet weak var tblViewOutlet: UITableView!
    @IBOutlet weak var showLbl: UILabel!
    @IBOutlet weak var btnShowOutlet: UIButton!
    
    var fruits = ["Mango","Banana","Orange", "Apple","Watermelon","Pineapple"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tblViewOutlet.isHidden = true
        showLbl.isHidden = true
    }


    @IBAction func DropDownAction(_ sender: UIButton) {
        if tblViewOutlet.isHidden{
            animate(toogle: true, type: btnOutlet)
        }else{
            animate(toogle: false, type: btnOutlet)
        }
    }
    
    @IBAction func ShowBtnAction(_ sender: UIButton) {
        showLbl.text = "Here are some fruits name. Like banana, oranage, apple. In this show button when click then show this message."
        if showLbl.isHidden{
            animate(toogle: true, type: btnShowOutlet)
        }else{
            animate(toogle: false, type: btnShowOutlet)
        }
        
    }
    
    func animate(toogle: Bool, type: UIButton){
        if type == btnOutlet{
            if toogle{
                UIView.animate(withDuration: 0.3) {
                    self.tblViewOutlet.isHidden = false
                }
            }else{
                UIView.animate(withDuration: 0.3) {
                    self.tblViewOutlet.isHidden = true
                }
            }
        }else{
            if toogle{
                UIView.animate(withDuration: 0.3) {
                    self.showLbl.isHidden = false
                }
            }else{
                UIView.animate(withDuration: 0.3) {
                    self.showLbl.isHidden = true
                }
            }
        }
    
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = fruits[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        btnOutlet.setTitle("\(fruits[indexPath.row])", for: .normal)
        animate(toogle: false, type: btnOutlet)
    }
}
