//
//  MenuTableViewCell.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/9/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var imgMenu: UIImageView!
    @IBOutlet weak var lbMenu: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setData(item:MenuEntity){
        imgMenu.image = UIImage(named: "\(item.icon!)")
        lbMenu.text = item.name
        
    }
    @IBAction func clickMenu(_ sender: Any) {
        self.directMenu?()
    }
    
    var directMenu:(()->())?
    
}
