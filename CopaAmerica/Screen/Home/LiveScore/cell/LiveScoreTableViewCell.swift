//
//  LiveScoreTableViewCell.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/11/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class LiveScoreTableViewCell: UITableViewCell {
    @IBOutlet weak var lbRegionLeft: UILabel!
    @IBOutlet weak var lbRegionRight: UILabel!
    @IBOutlet weak var lbTime: UILabel!
    @IBOutlet weak var imgRegionRight: UIImageView!
    @IBOutlet weak var imgRegionLeft: UIImageView!
    @IBOutlet weak var viewBound: UIView!
    @IBOutlet weak var imgFavorites: UIImageView!
    @IBOutlet weak var imgAlarm: UIImageView!
    var isFavorites: Bool = false
    var isSetAlarm: Bool = false
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setData(item: MatchesDetailEntity) {
        lbTime.text = getTimeFromTimeStamp(timeStamp: Double(item.time))
        lbRegionLeft.text = item.team_1
        lbRegionRight.text = item.team_2
        isFavorites = item.isFavorites
        isSetAlarm = item.isAlarm
        imgRegionLeft.setCustomImage(item.flag_team_2, defaultAvatar: nil)
        imgRegionRight.setCustomImage(item.flag_team_1, defaultAvatar: nil)
        checkSetAlarm()
        checkFavorites()
    }
    
    func setBorderBottom(){
        viewBound.frame = CGRect(x: 0, y: 0, width: self.contentView.frame.width, height: 70)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func checkFavorites() {
        if isFavorites {
            imgFavorites.image = UIImage(named: "icon_favorites_true")
        }else{
            imgFavorites.image = UIImage(named: "icon_favorites_livescore")
        }
    }
    func checkSetAlarm(){
        if isSetAlarm {
            imgAlarm.image = UIImage(named: "icon_alarm_true")
        }else{
            imgAlarm.image = UIImage(named: "icon_alarm_livescore")
        }
    }

    @IBAction func handlerFavorites(_ sender: Any) {
        isFavorites = !isFavorites
        checkFavorites()
        self.handlerFavorites?()
    }
    @IBAction func handlerAlarm(_ sender: Any) {
        if isSetAlarm {
            isSetAlarm != isSetAlarm
        }
        checkSetAlarm()
        self.handlerAlarm?()
    }
    var handlerFavorites:(()->())?
    var handlerAlarm:(()->())?
}
