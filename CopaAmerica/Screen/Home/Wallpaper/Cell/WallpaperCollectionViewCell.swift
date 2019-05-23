//
//  WallpaperCollectionViewCell.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/17/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit
import Gemini
class WallpaperCollectionViewCell: GeminiCell {
    @IBOutlet weak var imgDownload: UIImageView!
    @IBOutlet weak var viewBound: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
            layer.cornerRadius = 5
        imgDownload.layer.cornerRadius = 5        
    }
    func configure(with url: String) {
        imgDownload.setCustomImage(url, defaultAvatar: nil)
    }
    
    @IBAction func tapImage(_ sender: UITapGestureRecognizer) {
        
        
    }
    
}
