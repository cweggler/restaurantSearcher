//
//  UITableCell.swift
//  RestaurantSearcher
//
//  Created by Cara on 5/17/19.
//  Copyright © 2019 Cara. All rights reserved.
//

import UIKit

class UITableCell: UITableViewCell {
    
    @IBOutlet var restaurantName: UILabel!
    @IBOutlet var cuisine: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureCell(text: String) {
        
        
    }
}

