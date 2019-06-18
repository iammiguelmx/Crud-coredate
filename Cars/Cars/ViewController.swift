//
//  ViewController.swift
//  core
//
//

import UIKit

class ViewController: UIViewController, DataPass {
    
    
    @IBOutlet var txtMarca: UITextField!
    @IBOutlet var txtModelo: UITextField!
    @IBOutlet var txtTransmision: UITextField!
    @IBOutlet var txtAnio: UITextField!

    
    var i = Int()
    var isUpdate = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func btnSaveClick(_ sender: UIButton) {
        
        let dict : [String:String] = ["marca": txtMarca.text!, "modelo": txtModelo.text!, "transmision": txtTransmision.text!, "anio": txtAnio.text!]
        if isUpdate{
            DatabaseHelper.shareInstance.editCar(object: dict , i: i)
        }else{
            DatabaseHelper.shareInstance.save(object: dict )
        }
        
        txtMarca.text = nil
        txtModelo.text = nil
        txtTransmision.text = nil
        txtAnio.text = nil
      
    }
    
    @IBAction func btnShow(_ sender: Any) {
        let listVC = self.storyboard?.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        
        listVC.delegate = self
        
        self.navigationController?.pushViewController(listVC, animated: true)
        
        txtMarca.text = nil
        txtModelo.text = nil
        txtTransmision.text = nil
        txtAnio.text = nil
        
    }
    
    func data(object: [String : String], index: Int, isEdit: Bool) {
        
        txtMarca.text = object["marca"]
        txtModelo.text = object["modelo"]
        txtTransmision.text = object["transmision"]
        txtAnio.text = object["anio"]
        
        i = index
        isUpdate = isEdit
    }
    
}

