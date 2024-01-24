//
//  CeldaTableViewCell.swift
//  EjemploAlamoFire
//
//  Created by andreu navarro donderis on 24/01/2024.
//

import UIKit

class CeldaTableViewCell: UITableViewCell {

    @IBOutlet weak var imgFoto: UIImageView!
    @IBOutlet weak var lblNombre: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
