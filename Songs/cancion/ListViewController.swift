//
//  ListViewController.swift
//  core
//
//  Created by macmex on 5/9/19.
//  Copyright © 2019 Yogesh Patel. All rights reserved.
//

import UIKit
protocol DataPass {
    func data(object:[String:String], index:Int, isEdit:Bool)
}

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var song = [Songs]()
    
    var delegate:DataPass!
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        song = DatabaseHelper.shareInstance.getSongsData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return song.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        cell.song = song[indexPath.row]
        
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
            song = DatabaseHelper.shareInstance.deleteSong(index: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let dict = ["nombre": song[indexPath.row].nombre, "album":song[indexPath.row].album, "artista": song[indexPath.row].artista, "genero": song[indexPath.row].genero]
        
        delegate.data(object: dict as! [String:String], index: indexPath.row, isEdit: true)
        
        self.navigationController?.popViewController(animated: true)
    }
}
