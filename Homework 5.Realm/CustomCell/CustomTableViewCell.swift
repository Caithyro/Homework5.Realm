//
//  CustomTableViewCell.swift
//  Homework 5.Realm
//
//  Created by Дмитрий Куприенко on 20.12.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupCell(dataToDisplay: Description) {
        self.nameLabel.text = dataToDisplay.item?.itemName
        self.typeLabel.text = "Type: \(dataToDisplay.itemType)"
        self.quantityLabel.text = "Quantity: \(dataToDisplay.itemQuantity)"
        self.selectionStyle = .none
    }
}
