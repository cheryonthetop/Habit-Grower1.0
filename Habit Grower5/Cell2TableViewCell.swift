//
//  Cell2TableViewCell.swift
//  Habit Grower5
//
//  Created by Wendy Zhang on 9/21/19.
//  Copyright © 2019 Rice University. All rights reserved.
//

import UIKit

class Cell2TableViewCell: UITableViewCell {

        
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var lbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
