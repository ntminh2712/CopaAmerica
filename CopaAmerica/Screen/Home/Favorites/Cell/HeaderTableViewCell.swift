//
//  HeaderTableViewCell.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/11/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var viewBound: UIView!
    @IBOutlet weak var lbTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        viewBound.roundCorners(corners: [.topLeft, .topRight], radius: 15)
    }
    
    func setData(item: MatchesDetailEntity){
        lbTime.text = getDateFromTimeStamp(timeStamp: Double(item.time))
    }
}
