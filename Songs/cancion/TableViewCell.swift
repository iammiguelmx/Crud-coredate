//
//  TableViewCell.swift
//  core
//
//  Created by macmex on 5/9/19.
//  Copyright © 2019 Yogesh Patel. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    

    @IBOutlet var lblNombre: UILabel!
    @IBOutlet var lblArtista: UILabel!
    @IBOutlet var lblGenero: UILabel!
    @IBOutlet var lblAlbum: UILabel!
    
    
   
    
    var song:Songs!{
        didSet{
            lblNombre.text = song.nombre
            lblArtista.text = song.artista
            lblGenero.text = song.genero
            lblAlbum.text = song.album
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
