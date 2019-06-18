//
//  ViewController.swift
//  core
//
//

import UIKit

class ViewController: UIViewController, DataPass {
    
    
    @IBOutlet var txtMesa: UITextField!
    @IBOutlet var txtPersonas: UITextField!
    @IBOutlet var txtMesero: UITextField!
    @IBOutlet var txtArea: UITextField!
    
    
    var i = Int()
    var isUpdate = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func btnSaveClick(_ sender: UIButton) {
        
        let dict : [String:String] = ["mesa": txtMesa.text!, "personas": txtPersonas.text!, "mesero": txtMesero.text!, "area": txtArea.text!]
        if isUpdate{
            DatabaseHelper.shareInstance.editFood(object: dict , i: i)
        }else{
            DatabaseHelper.shareInstance.save(object: dict )
        }
        
        txtMesa.text = nil
        txtPersonas.text = nil
        txtMesero.text = nil
        txtArea.text = nil
    
    }
    
    @IBAction func btnShow(_ sender: Any) {
        let listVC = self.storyboard?.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        
        listVC.delegate = self
        
        self.navigationController?.pushViewController(listVC, animated: true)
        
        txtMesa.text = nil
        txtPersonas.text = nil
        txtMesero.text = nil
        txtArea.text = nil
    }
    
    func data(object: [String : String], index: Int, isEdit: Bool) {
        
        txtMesa.text = object["mesa"]
        txtPersonas.text = object["personas"]
        txtMesero.text = object["mesero"]
        txtArea.text = object["area"]
        
        
        i = index
        isUpdate = isEdit
    }
    
}

