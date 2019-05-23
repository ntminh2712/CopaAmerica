//
//  FavoritesTableViewCell.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/10/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {

    @IBOutlet weak var lbRegionLeft: UILabel!
    @IBOutlet weak var lbRegionRight: UILabel!
    @IBOutlet weak var lbTime: UILabel!
    @IBOutlet weak var imgRegionRight: UIImageView!
    @IBOutlet weak var imgRegionLeft: UIImageView!
    @IBOutlet weak var viewBound: UIView!
    @IBOutlet weak var imgFavorites: UIImageView!
    var isFavorites: Bool = true
    override func awakeFromNib() {
        super.awakeFromNib()
        checkFavorites()
        viewBound.frame = CGRect(x: 0, y: 0, width: self.contentView.frame.width, height: 70)
        
    }
    func checkFavorites() {
        if isFavorites {
            imgFavorites.image = UIImage(named: "icon_favorites_true")
        }else{
            imgFavorites.image = UIImage(named: "icon_favorites_livescore")
        }
    }
    func setData(item: MatchesDetailEntity) {
        lbTime.text = getTimeFromTimeStamp(timeStamp: Double(item.time))
        lbRegionLeft.text = item.team_1
        lbRegionRight.text = item.team_1
        isFavorites = item.isFavorites
        imgRegionLeft.setCustomImage(item.flag_team_1!, defaultAvatar: nil)
        imgRegionRight.setCustomImage(item.flag_team_2!, defaultAvatar: nil)
        checkFavorites()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func handlerFavorites(_ sender: Any) {
        isFavorites = !isFavorites
        checkFavorites()
        self.handlerFavorites?()
    }
    var handlerFavorites: (()->())?
}
