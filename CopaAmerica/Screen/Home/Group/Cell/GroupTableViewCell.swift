
//
//  GroupTableViewCell.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/16/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class GroupTableViewCell: UITableViewCell {

    @IBOutlet weak var viewBound: UIView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var imgRegion: UIImageView!
    @IBOutlet weak var lbPlayed: UILabel!
    @IBOutlet weak var lbWin: UILabel!
    @IBOutlet weak var lbDraw: UILabel!
    @IBOutlet weak var lbLost: UILabel!
    @IBOutlet weak var lbPoints: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(item: GroupChildEntity){
        lbName.text = item.name
        lbPlayed.text = "\(item.played!)"
        lbWin.text = "\(item.win!)"
        lbLost.text = "\(item.lost!)"
        lbPoints.text = "\(item.points!)"
        lbDraw.text = "\(item.draw!)"
        imgRegion.setCustomImage("\(item.flag!)", defaultAvatar: nil)
        
    }
    
    func setBorderBottom() {
//        let shadowSize: CGFloat = 1
//        let contactRect = CGRect(x: -shadowSize, y: viewBound.frame.height - (shadowSize * 0.2), width: viewBound.frame.width + shadowSize * 2, height: shadowSize)
//        contentView.layer.shadowPath = UIBezierPath(ovalIn: contactRect).cgPath
//        contentView.layer.shadowOpacity = 0.6
//                viewBound.roundCorners(corners: [ .bottomLeft,.bottomRight], radius: 15)
    }
    
}
