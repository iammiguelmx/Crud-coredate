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

    var student = [Students]()
    var delegate:DataPass!
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        student = DatabaseHelper.shareInstance.getStundetsData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return student.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        /*
        cell.lblTitulo.text = book[indexPath.row].titulo
        cell.lblAutor.text = book[indexPath.row].autor
        cell.lblEditorial.text = book[indexPath.row].editorial
        cell.lblPaginas.text = book[indexPath.row].paginas */
        
        cell.student = student[indexPath.row]
        
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
            student = DatabaseHelper.shareInstance.deleteStundet(index: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let dict = ["codigo": student[indexPath.row].codigo, "direccion":student[indexPath.row].direccion, "especialidad": student[indexPath.row].especialidad, "nombre": student[indexPath.row].nombre,
            "telefono": student[indexPath.row].telefono]
        
        delegate.data(object: dict as! [String:String], index: indexPath.row, isEdit: true)
        
        self.navigationController?.popViewController(animated: true)
    }
}
