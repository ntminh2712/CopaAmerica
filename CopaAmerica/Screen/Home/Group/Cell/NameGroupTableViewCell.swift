//
//  NameGroupTableViewCell.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/16/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class NameGroupTableViewCell: UITableViewCell {

    @IBOutlet weak var lbName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func directMatches(_ sender: Any) {
        self.showMatches?()
    }
    func setData(item: GroupChildEntity){
        
    }
    
    
    var showMatches:(()->())?
}
