//
//  TableViewCell.swift
//  core
//
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var lblcodigo: UILabel!
    @IBOutlet var LblProducto: UILabel!
    @IBOutlet var LblCategoria: UILabel!
    @IBOutlet var LblPrecio: UILabel!
    

    var product:Products! {
        
        didSet{
            lblcodigo.text = product.codigo
            LblProducto.text = product.producto
            LblCategoria.text = product.categoria
            LblPrecio.text = product.precio
           
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
