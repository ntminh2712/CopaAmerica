//
//  FeedBackViewController.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/16/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit
import MessageUI
class FeedBackViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var tfYourName: UITextField!
    @IBOutlet weak var tfYourEmail: UITextField!
    @IBOutlet weak var tfYourTitle: UITextField!
    @IBOutlet weak var tfYourFeedback: UITextField!
    @IBOutlet weak var viewContainerThanks: UIView!
    @IBOutlet weak var viewSendEmail: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewContainerThanks.isHidden = true
        setupView()
    }
    
    
    func setupView() {
        tfYourName.setLayoutViewOption()
        tfYourEmail.setLayoutViewOption()
        tfYourTitle.setLayoutViewOption()
        tfYourFeedback.roundCorners(corners: [.topRight,.topLeft,.bottomLeft,.bottomRight], radius: 20)
        
    }
    func sendEmail() {
        guard MFMailComposeViewController.canSendMail() else {
            let alert = UIAlertController(title: "No mail Accounts", message: "IPlease set up a Mail account in order to send email.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
            return
        }
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setSubject(tfYourTitle.text!)
            mail.setToRecipients(["you@yoursite.com"])
            mail.setMessageBody(tfYourFeedback.text!, isHTML: true)
            
            present(mail, animated: true)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
}
