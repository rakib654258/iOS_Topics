//
//  ViewController.swift
//  DynamicallyAddViewInTableView
//
//  Created by RakiB on 11/6/20.
//  Copyright © 2020 RK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    struct Info: Decodable {
        let name: String
        let age: String
    }
    
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    var numberOfCell = 0
    var InfoArray = [Info]()
    //var CellIndexPath = [IndexPath(row: 0, section: 0)]
    var indexcount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        tableViewHeightConstraint.constant = tableView.contentSize.height
    }
    @IBAction func addSubTask(_ sender: UIButton) {
        numberOfCell += 1
        tableViewHeightConstraint.constant = CGFloat.greatestFiniteMagnitude
        print(numberOfCell)
        tableView.reloadData()
        tableView.layoutIfNeeded()
        tableViewHeightConstraint.constant = tableView.contentSize.height
    }
    @IBAction func showTaskValues(_ sender: UIButton) {
        
            //let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! MyCellVC
        print(numberOfCell)
        var body = Data()
        for i in 0..<numberOfCell{
            let index = IndexPath(row: i, section: 0)
            print(index)
//            let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: index) as! MyCellVC
            if let cell = tableView.cellForRow(at: index) as? MyCellVC {
                // do what you need with cell
                let name = cell.nameTF.text
                let age = cell.ageTF.text
                self.InfoArray.append(Info(name: name ?? "No Data", age: age ?? "No Data"))
                print(InfoArray)
                
            }
        }
        print(InfoArray)
        print(InfoArray[1])
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfCell
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //CellIndexPath.append(indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyCellVC
        print(indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}
