//
//  ViewController.swift
//  core
//
//

import UIKit

class ViewController: UIViewController, DataPass {
    
    
    @IBOutlet var txtCodigo: UITextField!
    @IBOutlet var txtProducto: UITextField!
    @IBOutlet var txtCategotia: UITextField!
    @IBOutlet var txtPrecio: UITextField!
    
    var i = Int()
    var isUpdate = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func btnSaveClick(_ sender: UIButton) {
        
        let dict : [String:String] = ["codigo": txtCodigo.text!, "producto": txtProducto.text!, "categoria": txtCategotia.text!, "precio": txtPrecio.text!]
        if isUpdate{
            DatabaseHelper.shareInstance.editProduct(object: dict , i: i)
        }else{
            DatabaseHelper.shareInstance.save(object: dict )
        }
        
        txtCodigo.text = nil
        txtProducto.text = nil
        txtCategotia.text = nil
        txtPrecio.text = nil
        
    }
    
    @IBAction func btnShow(_ sender: Any) {
        let listVC = self.storyboard?.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        
        listVC.delegate = self
        
        self.navigationController?.pushViewController(listVC, animated: true)
    
        txtCodigo.text = nil
        txtProducto.text = nil
        txtCategotia.text = nil
        txtPrecio.text = nil
    }
    
    func data(object: [String : String], index: Int, isEdit: Bool) {
        
        txtCodigo.text = object["codigo"]
        txtProducto.text = object["producto"]
        txtCategotia.text = object["categoria"]
        txtPrecio.text = object["precio"]
        
        
        i = index
        isUpdate = isEdit
    }
    
}

