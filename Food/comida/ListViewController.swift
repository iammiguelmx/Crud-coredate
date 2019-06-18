//
//  ListViewController.swift
//  core
//
//

import UIKit
protocol DataPass {
    func data(object:[String:String], index:Int, isEdit:Bool)
}

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var food = [Foods]()
    
    var delegate:DataPass!
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        food = DatabaseHelper.shareInstance.getFoodsData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return food.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        cell.food = food[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            food = DatabaseHelper.shareInstance.deleteFood(index: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let dict = ["mesa": food[indexPath.row].mesa, "personas":food[indexPath.row].personas, "mesero": food[indexPath.row].mesero, "area": food[indexPath.row].area]
        
        delegate.data(object: dict as! [String:String], index: indexPath.row, isEdit: true)
        
        self.navigationController?.popViewController(animated: true)
    }
}
