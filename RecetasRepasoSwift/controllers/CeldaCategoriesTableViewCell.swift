//
//  CeldaCategoriesTableViewCell.swift
//  RecetasRepasoSwift
//
//  Created by Ignacio Campillos Serrano on 24/01/2024.
//

//Maneja el contenido de las celdas de las tableview, se usa en ambas tablas ya que ambas celdas
//tienen el mismo contenido (foto y lb)

import UIKit

class CeldaCategoriesTableViewCell: UITableViewCell {

    @IBOutlet weak var imPhoto: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
