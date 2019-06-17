//
//  TableViewCell.swift
//  core
//
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var lblcodigo: UILabel!
    @IBOutlet var lblNombre: UILabel!
    @IBOutlet var lblTelefono: UILabel!
    @IBOutlet var LblDireccion: UILabel!
    @IBOutlet var lblEspecialidad: UILabel!
    
    var student:Students!{
        
        didSet{
            lblcodigo.text = student.codigo
            lblNombre.text = student.nombre
            lblTelefono.text = student.telefono
            LblDireccion.text = student.direccion
            lblEspecialidad.text = student.especialidad
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
