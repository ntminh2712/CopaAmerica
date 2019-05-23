//
//  MatcheInfoViewController.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/18/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class MatcheInfoViewController: UIViewController {

    @IBOutlet weak var viewBound: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
    }
    
    func setupLayout()
    {
        viewBound.layer.cornerRadius = 5
        viewBound.layer.borderColor = UIColor.clear.cgColor
        viewBound.layer.shadowColor = UIColor.gray.cgColor
        viewBound.layer.shadowOffset = CGSize.zero
        viewBound.layer.shadowRadius = 2
        viewBound.layer.shadowOpacity = 0.5
        
    }
  

}
