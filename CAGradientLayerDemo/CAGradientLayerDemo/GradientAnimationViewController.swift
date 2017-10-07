//
//  GradientAnimationViewController.swift
//  CAGradientLayerDemo
//
//  Created by longjianjiang on 2017/10/7.
//  Copyright © 2017年 Jiang. All rights reserved.
//

import UIKit

class LockEffectLabel: UIView {
    var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        
        layer.startPoint = CGPoint(x: 0, y: 0.5)
        layer.endPoint = CGPoint(x: 1, y: 0.5)


        layer.colors = [
                UIColor.black.cgColor,
                UIColor.white.cgColor,
                UIColor.black.cgColor]
        
        let locations: [NSNumber] = [
            0.25,
            0.5,
            0.75]
        layer.locations = locations
        
        layer.backgroundColor = UIColor.red.cgColor
        return layer
    }()
    
    let textAttributes: [NSAttributedStringKey: AnyObject] = {
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        return [
            NSAttributedStringKey(rawValue: NSAttributedStringKey.font.rawValue): UIFont(
                name: "HelveticaNeue-Thin",
                size: 28.0)!,
            NSAttributedStringKey(rawValue: NSAttributedStringKey.paragraphStyle.rawValue): style
        ]
    }()

    var text: String!

    override func layoutSubviews() {
        gradientLayer.frame = CGRect(x: -bounds.width,
                                     y: bounds.origin.y,
                                     width: 3 * bounds.width,
                                     height: bounds.height)
        
        setNeedsDisplay()
        let image = UIGraphicsImageRenderer(size: bounds.size)
            .image { _ in
                text.draw(in: bounds, withAttributes: textAttributes)
        }
        
        let maskLayer = CALayer()
        maskLayer.backgroundColor = UIColor.clear.cgColor
        maskLayer.frame = bounds.offsetBy(dx: bounds.width, dy: 0)
        maskLayer.contents = image.cgImage
        
        gradientLayer.mask = maskLayer
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        
        layer.addSublayer(gradientLayer)
        
        let gradientAnimation = CABasicAnimation(keyPath: "locations")
        gradientAnimation.fromValue = [0.0, 0.0, 0.25]
        gradientAnimation.toValue = [0.75, 1.0, 1.0]
        gradientAnimation.duration = 3.0
        gradientAnimation.repeatCount = Float.infinity
        
        gradientLayer.add(gradientAnimation, forKey: nil)
    }
    
}
class GradientAnimationViewController: UIViewController {
    var slideLockView = LockEffectLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.gray
        
        slideLockView.text = "滑动来解锁"
        slideLockView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(slideLockView)
        
        slideLockView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70).isActive = true
        slideLockView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70).isActive = true
        slideLockView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        slideLockView.heightAnchor.constraint(equalToConstant: 44).isActive = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
