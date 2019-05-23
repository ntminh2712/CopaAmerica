//
//  UIView+Extension.swift
//  BaseSwift
//
//  Created by nava on 7/13/18.
//  Copyright © 2018 nava. All rights reserved.
//

import UIKit

extension UIView{
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat, borderColor:CGColor?) {
        
        self.layer.masksToBounds = true
        let bounds = self.bounds
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.frame = bounds
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func makeCircleView(){
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.bounds.width / 2
    }
    
    func constrainCentered(_ subview: UIView) {
        
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        let verticalContraint = NSLayoutConstraint(
            item: subview,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: self,
            attribute: .centerY,
            multiplier: 1.0,
            constant: 0)
        
        let horizontalContraint = NSLayoutConstraint(
            item: subview,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: self,
            attribute: .centerX,
            multiplier: 1.0,
            constant: 0)
        
        let heightContraint = NSLayoutConstraint(
            item: subview,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0,
            constant: subview.frame.height)
        
        let widthContraint = NSLayoutConstraint(
            item: subview,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0,
            constant: subview.frame.width)
        
        addConstraints([
            horizontalContraint,
            verticalContraint,
            heightContraint,
            widthContraint])
        
    }
    
    func constrainToEdges(_ subview: UIView) {
        
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        var topContraint = NSLayoutConstraint(
            item: subview,
            attribute: .top,
            relatedBy: .equal,
            toItem: self,
            attribute: .top,
            multiplier: 1.0,
            constant: 75)
        if UIDevice.current.screenType == UIDevice.ScreenType.iPhones_X_XS || UIDevice.current.screenType == UIDevice.ScreenType.iPhone_XR || UIDevice.current.screenType == UIDevice.ScreenType.iPhone_XSMax
        {
            topContraint = NSLayoutConstraint(
                item: subview,
                attribute: .top,
                relatedBy: .equal,
                toItem: self,
                attribute: .top,
                multiplier: 1.0,
                constant: 95)
        }
        let bottomConstraint = NSLayoutConstraint(
            item: subview,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: self,
            attribute: .bottom,
            multiplier: 1.0,
            constant: 0)
        
        let leadingContraint = NSLayoutConstraint(
            item: subview,
            attribute: .leading,
            relatedBy: .equal,
            toItem: self,
            attribute: .leading,
            multiplier: 1.0,
            constant: 0)
        
        let trailingContraint = NSLayoutConstraint(
            item: subview,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: self,
            attribute: .trailing,
            multiplier: 1.0,
            constant: 0)
        
        addConstraints([
            topContraint,
            bottomConstraint,
            leadingContraint,
            trailingContraint])
    }
    func setViewBorderShadowCard() {
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 0
        self.layer.borderColor = UIColor.clear.cgColor
        self.backgroundColor = UIColor.clear
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 2
    }
    func setViewRadius() {
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 0
        self.layer.borderColor = UIColor.clear.cgColor
    }
    func setShadowOnlyView() {
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowOpacity = 0.6
        self.layer.shadowRadius = 2
        self.layer.shadowColor = UIColor.gray.cgColor
    }
    func setBorderShadow() {
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 3
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.5
    }
    func setLayoutViewOption() {
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = #colorLiteral(red: 0.8026832938, green: 0.8032975793, blue: 0.8027783632, alpha: 1)
    }
    func setLayoutViewSearch() {
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.clear.cgColor
    }
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
}
@IBDesignable
class GradientView: UIView {
    
    @IBInspectable var startColor:   UIColor = .black { didSet { updateColors() }}
    @IBInspectable var endColor:     UIColor = .white { didSet { updateColors() }}
    @IBInspectable var startLocation: Double =   0.05 { didSet { updateLocations() }}
    @IBInspectable var endLocation:   Double =   0.95 { didSet { updateLocations() }}
    @IBInspectable var horizontalMode:  Bool =  false { didSet { updatePoints() }}
    @IBInspectable var diagonalMode:    Bool =  false { didSet { updatePoints() }}
    
    override class var layerClass: AnyClass { return CAGradientLayer.self }
    
    var gradientLayer: CAGradientLayer { return layer as! CAGradientLayer }
    
    func updatePoints() {
        if horizontalMode {
            gradientLayer.startPoint = diagonalMode ? CGPoint(x: 1, y: 0) : CGPoint(x: 0, y: 0.5)
            gradientLayer.endPoint   = diagonalMode ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0.5)
        } else {
            gradientLayer.startPoint = diagonalMode ? CGPoint(x: 0, y: 0) : CGPoint(x: 0.5, y: 0)
            gradientLayer.endPoint   = diagonalMode ? CGPoint(x: 1, y: 1) : CGPoint(x: 0.5, y: 1)
        }
    }
    func updateLocations() {
        gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
    }
    func updateColors() {
        gradientLayer.colors    = [startColor.cgColor, endColor.cgColor]
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updatePoints()
        updateLocations()
        updateColors()
    }
}
