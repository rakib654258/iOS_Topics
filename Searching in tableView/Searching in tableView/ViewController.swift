//
//  ViewController.swift
//  Searching in tableView
//
//  Created by RakiB on 6/1/20.
//  Copyright © 2020 RakiB. All rights reserved.
//

//import UIKit
//
//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
//
//
//}
import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate{


    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
var arrData : [String] = []
var arrFilterData : [String] = []
var isSearch : Bool!


override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.

    isSearch = false

    arrData = ["Apple", "Banana", "Chikoo", "Brew", "Cherry", "Mango", "Lotus", "Peacock", "Temple", "Pine Apple","Glass", "Rose", "Church", "Computer", "Carrot"]

}

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}

// MARK:- textfield

public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{

    var searchText  = textField.text! + string

    if string  == "" {
        searchText = (searchText as String).substring(to: searchText.index(before: searchText.endIndex))
    }

    if searchText == "" {
        isSearch = false
        tableView.reloadData()
    }
    else{
        getSearchArrayContains(searchText)
    }

    return true
}

// Predicate to filter data
func getSearchArrayContains(_ text : String) {
    var predicate : NSPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", text)
    arrFilterData = (arrData as NSArray).filtered(using: predicate) as! [String]
    isSearch = true
    tableView.reloadData()
}

// MARK:- TableView Delegates
public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{

    if isSearch! {
        return arrFilterData.count
    }
    else{

        return arrData.count
    }
}

public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{

    var cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

    if isSearch! {
        cell.textLabel!.text = arrFilterData[indexPath.row]
    }
    else{

        cell.textLabel!.text = arrData[indexPath.row]
    }
    return cell
}
}
