//
//  TableViewCell.swift
//  core
//
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet var lblModelo: UILabel!
    @IBOutlet var lblMarca: UILabel!
    @IBOutlet var lblTransmision: UILabel!
    @IBOutlet var lblAnio: UILabel!
    
  
    
    var car:Cars!{
        didSet{
            lblModelo.text = car.modelo
            lblMarca.text = car.marca
            lblTransmision.text = car.transmision
            lblAnio.text = car.anio
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
