//
//  TitleTopScorersTableViewCell.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/11/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class TitleTopScorersTableViewCell: UITableViewCell {

    @IBOutlet weak var viewBound: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        viewBound.roundCorners(corners: [.topLeft, .topRight], radius: 15)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
