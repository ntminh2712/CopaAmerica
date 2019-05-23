//
//  TimeTableViewCell.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/16/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class TimeTableViewCell: UITableViewCell {

    @IBOutlet weak var lbTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func selectTime(_ sender: Any) {
        self.selectTime?()
    }
    
    var selectTime:(()->())?
    
}
