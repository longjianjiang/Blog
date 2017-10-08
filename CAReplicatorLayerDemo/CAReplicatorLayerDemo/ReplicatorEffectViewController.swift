//
//  ReplicatorEffectViewController.swift
//  CAReplicatorLayerDemo
//
//  Created by longjianjiang on 2017/10/8.
//  Copyright © 2017年 Jiang. All rights reserved.
//

import UIKit

class ReplicatorEffectViewController: UIViewController {

    let replicator = CAReplicatorLayer()
    let dot = CALayer()
    
    let dotLength: CGFloat = 6.0
    let dotOffset: CGFloat = 8.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        replicator.frame = view.bounds
        view.layer.addSublayer(replicator)
        
        dot.frame = CGRect(
            x: replicator.frame.size.width - dotLength,
            y: replicator.position.y,
            width: dotLength,
            height: dotLength)
        
        dot.backgroundColor = UIColor.orange.cgColor
        dot.borderColor = UIColor(white: 1.0, alpha: 1.0).cgColor
        dot.borderWidth = 0.5
        dot.cornerRadius = 1.5
        replicator.addSublayer(dot)
        
        replicator.instanceCount = Int(view.frame.size.width / dotOffset)
        replicator.instanceTransform = CATransform3DMakeTranslation(-dotOffset, 0.0, 0.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
