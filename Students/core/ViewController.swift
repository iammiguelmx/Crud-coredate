//
//  ViewController.swift
//  core
//
//

import UIKit

class ViewController: UIViewController, DataPass {
    
    
    @IBOutlet var txtCodigo: UITextField!
    @IBOutlet var txtDireccion: UITextField!
    @IBOutlet var txtEspecialidad: UITextField!
    @IBOutlet var txtNombre: UITextField!
    @IBOutlet var txtTelefono: UITextField!
    
    var i = Int()
    var isUpdate = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func btnSaveClick(_ sender: UIButton) {
        
        let dict : [String:String] = ["codigo": txtCodigo.text!, "direccion": txtDireccion.text!, "especialidad": txtEspecialidad.text!, "nombre": txtNombre.text!, "telefono": txtTelefono.text!]
        if isUpdate{
            DatabaseHelper.shareInstance.editStundet(object: dict,  i: i)
        }else{
            DatabaseHelper.shareInstance.save(object: dict )
        }
        
        txtCodigo.text = nil
        txtDireccion.text = nil
        txtEspecialidad.text = nil
        txtNombre.text = nil
        txtTelefono.text = nil
        
        //let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        //self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @IBAction func btnShow(_ sender: Any) {
        let listVC = self.storyboard?.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        
        listVC.delegate = self
        
        self.navigationController?.pushViewController(listVC, animated: true)
    
        txtCodigo.text = nil
        txtDireccion.text = nil
        txtEspecialidad.text = nil
        txtNombre.text = nil
        txtTelefono.text = nil
    }
    
    func data(object: [String : String], index: Int, isEdit: Bool) {
        
        txtCodigo.text = object["codigo"]
        txtDireccion.text = object["direccion"]
        txtEspecialidad.text = object["especialidad"]
        txtNombre.text = object["nombre"]
        txtTelefono.text = object["telefono"]
        
        i = index
        isUpdate = isEdit
    }
    
}

