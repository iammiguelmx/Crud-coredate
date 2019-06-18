//
//  TableViewCell.swift
//  core
//
//

import UIKit

class TableViewCell: UITableViewCell {
    

    @IBOutlet var lblMesa: UILabel!
    @IBOutlet var lblPersonas: UILabel!
    @IBOutlet var lblMesero: UILabel!
    @IBOutlet var lblArea: UILabel!
    
    
    var food:Foods!{
        didSet{
            lblMesa.text = food.mesa
            lblPersonas.text = food.personas
            lblMesero.text = food.mesero
            lblArea.text = food.area
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
