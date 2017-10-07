//
//  GradientEffectViewController.swift
//  CAGradientLayerDemo
//
//  Created by longjianjiang on 2017/10/7.
//  Copyright © 2017年 Jiang. All rights reserved.
//

import UIKit

class GradientEffectViewController: UIViewController {

    var colorLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        colorLayer.startPoint = CGPoint.zero
        colorLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        colorLayer.frame = view.bounds
        
        view.layer.addSublayer(colorLayer)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
