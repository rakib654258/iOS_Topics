//
//  ViewController.swift
//  DynamicCellHeight
//
//  Created by macOS Mojave on 5/3/19.
//  Copyright © 2019 macOS Mojave. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var myArray = ["Here is the first text.","Here is the second text. It is for long text contain.","Here is the third text. It is for longest text contain.This text is really very very long! I hope it can be read completely."]
    override func viewDidLoad() {
        super.viewDidLoad()

        //tableView.rowHeight = UITableView.automaticDimension
        //tableView.estimatedRowHeight = 100
        // Do any additional setup after loading the view, typically from a nib.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! customTableViewCell
        
        cell.myLbl.text = myArray[indexPath.row]

        return cell
    }


}

