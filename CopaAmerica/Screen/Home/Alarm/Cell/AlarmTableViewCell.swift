//
//  AlarmTableViewCell.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/11/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class AlarmTableViewCell: UITableViewCell {

    @IBOutlet weak var lbNameMatch: UILabel!
    @IBOutlet weak var lbTime: UILabel!
    @IBOutlet weak var lbTimeAlarm: UILabel!
    @IBOutlet weak var heightViewOption: NSLayoutConstraint!
    @IBOutlet weak var lbStatus: UILabel!
    @IBOutlet weak var imgDelete: UIImageView!
    @IBOutlet weak var imgEdit: UIImageView!
    @IBOutlet weak var lbEdit: UILabel!
    @IBOutlet weak var lbDelete: UILabel!
    @IBOutlet weak var viewBound: UIView!
    
    var isShowOption: Bool = false
    override func awakeFromNib() {
        super.awakeFromNib()
        checkOption(value: isShowOption)
        viewBound.setBorderShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func checkOption(value: Bool){
        if value {
            lbDelete.isHidden = false
            lbEdit.isHidden = false
            imgEdit.isHidden = false
            imgDelete.isHidden = false
            heightViewOption.constant = 120
        }else{
            lbDelete.isHidden = true
            lbEdit.isHidden = true
            imgEdit.isHidden = true
            imgDelete.isHidden = true
            heightViewOption.constant = 0
            
        }
    }
    
    
    func setData(item: AlarmEntity) {
        lbTime.text = getTimeDateFromTimeStamp(timeStamp: Double(item.time))
        lbTimeAlarm.text = item.timeAlarm?.toString(withFormat: "hh:mm")
        lbNameMatch.text = "\((item.team_1)!) - \((item.team_2)!)"
        
        
    }
    
    func setTextLabel(time: String) {
        lbTime.text = time
    }
    
    @IBAction func editAlarm(_ sender: Any) {
        self.editAlarm?()
    }
    @IBAction func deleteAlarm(_ sender: Any) {
        self.alertCheckDelete?()
    }
    @IBAction func showOptionAlarm(_ sender: Any) {
        isShowOption = !isShowOption
        checkOption(value: isShowOption)
    }
    var alertCheckDelete: (()->())?
    var editAlarm: (()->())?
}



