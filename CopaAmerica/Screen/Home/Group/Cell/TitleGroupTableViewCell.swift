//
//  TitleGroupTableViewCell.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/16/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class TitleGroupTableViewCell: UITableViewCell {

    @IBOutlet weak var lbPld: UILabel!
    @IBOutlet weak var lbW: UILabel!
    @IBOutlet weak var viewBound: UIView!
    @IBOutlet weak var lbD: UILabel!
    @IBOutlet weak var lbL: UILabel!
    @IBOutlet weak var lbPts: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        viewBound.roundCorners(corners: [ .topRight,.topLeft], radius: 15)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
