//
//  PlayerTopScoresTableViewCell.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/16/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class PlayerTopScoresTableViewCell: UITableViewCell {

    @IBOutlet weak var lbTop: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbGoals: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
