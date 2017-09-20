//
//  ViewController.swift
//  LayerAnimationDemo
//
//  Created by longjianjiang on 2017/9/18.
//  Copyright © 2017年 Jiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var leftConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let springMoveLeftAnimation = CABasicAnimation(keyPath: "position.x")
        springMoveLeftAnimation.fromValue = -view.frame.width
        springMoveLeftAnimation.toValue = view.frame.width / 2.0
        springMoveLeftAnimation.duration = 0.7
        springMoveLeftAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        springMoveLeftAnimation.beginTime = CACurrentMediaTime() + 0.3
        
        springMoveLeftAnimation.fillMode = kCAFillModeBoth
//        springMoveLeftAnimation.isRemovedOnCompletion = false //不建议使用
        
        colorView.layer.add(springMoveLeftAnimation, forKey: nil)
        
        leftConstraint.constant = (view.frame.width/2 - colorView.frame.width/2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

