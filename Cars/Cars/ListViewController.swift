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

    var car = [Cars]()
    var delegate:DataPass!
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        car = DatabaseHelper.shareInstance.getCarsData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return car.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.car = car[indexPath.row]
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
            car = DatabaseHelper.shareInstance.deleteCar(index: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let dict = ["marca": car[indexPath.row].marca, "modelo":car[indexPath.row].modelo, "transmision": car[indexPath.row].transmision, "anio": car[indexPath.row].anio]
        
        delegate.data(object: dict as! [String:String], index: indexPath.row, isEdit: true)
        
        self.navigationController?.popViewController(animated: true)
    }
}
