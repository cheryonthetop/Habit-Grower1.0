//
//  PetTableViewCell.swift
//  Habit Grower5
//
//  Created by Wendy Zhang on 9/22/19.
//  Copyright © 2019 Rice University. All rights reserved.
//

import UIKit

class PetTableViewCell: UITableViewCell {

    @IBOutlet weak var petimg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
