//
//  ViewController.swift
//  core
//
//

import UIKit

class ViewController: UIViewController, DataPass {
    
    
    @IBOutlet var txtNombre: UITextField!
    @IBOutlet var txtArtista: UITextField!
    @IBOutlet var txtAlbum: UITextField!
    @IBOutlet var txtGenero: UITextField!
    

    
    var i = Int()
    var isUpdate = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func btnSaveClick(_ sender: UIButton) {
        
        let dict : [String:String] = ["nombre": txtNombre.text!, "album": txtAlbum.text!, "artista": txtArtista.text!, "genero": txtGenero.text!]
        if isUpdate{
            DatabaseHelper.shareInstance.editSong(object: dict , i: i)
        }else{
            DatabaseHelper.shareInstance.save(object: dict )
        }
        
        txtNombre.text = nil
        txtArtista.text = nil
        txtAlbum.text = nil
        txtGenero.text = nil
    
    }
    
    @IBAction func btnShow(_ sender: Any) {
        let listVC = self.storyboard?.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        
        listVC.delegate = self
        
        self.navigationController?.pushViewController(listVC, animated: true)
        
        txtNombre.text = nil
        txtArtista.text = nil
        txtAlbum.text = nil
        txtGenero.text = nil
    }
    
    func data(object: [String : String], index: Int, isEdit: Bool) {
        
        txtNombre.text = object["nombre"]
        txtArtista.text =  object["artista"]
        txtAlbum.text =  object["album"]
        txtGenero.text =  object["genero"]
        
        
        i = index
        isUpdate = isEdit
    }
    
}

