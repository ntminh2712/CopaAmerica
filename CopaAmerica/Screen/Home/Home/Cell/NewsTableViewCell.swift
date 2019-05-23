//
//  NewsTableViewCell.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/9/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var imgNews: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbDescrption: UILabel!
    @IBOutlet weak var viewBound: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.viewBound.setViewRadius()
        self.viewBound.setBorderShadow()
        imgNews.setViewRadius()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDataNews(item: NewsDetailEntity) {
        imgNews.setCustomImage(item.featured_image!, defaultAvatar: nil)
        lbTitle.text = item.title
        lbDescrption.text = item.slug
    }
    
    @IBAction func showDetail(_ sender: Any) {
        self.showDetail?()
    }

    var showDetail: (()->())?
}

