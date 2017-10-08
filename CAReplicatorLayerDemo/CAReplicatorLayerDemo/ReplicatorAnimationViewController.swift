//
//  ReplicatorAnimationViewController.swift
//  CAReplicatorLayerDemo
//
//  Created by longjianjiang on 2017/10/8.
//  Copyright © 2017年 Jiang. All rights reserved.
//

import UIKit

class ReplicatorAnimationViewController: UIViewController {

    let replicator = CAReplicatorLayer()
    let dot = CALayer()
    let monitor = MicMonitor()

    let dotLength: CGFloat = 6.0
    let dotOffset: CGFloat = 8.0
    
    var lastTransformScale: CGFloat = 0.0
    var voiceBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        voiceBtn.backgroundColor = UIColor.gray
        voiceBtn.setTitle("voice", for: .normal)
        voiceBtn.addTarget(self, action: #selector(actionStartMonitoring(_:)), for: .touchDown)
        voiceBtn.addTarget(self, action: #selector(actionEndMonitoring(_:)), for: .touchUpInside)
        voiceBtn.addTarget(self, action: #selector(actionEndMonitoring(_:)), for: .touchUpOutside)
        voiceBtn.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(voiceBtn)
        voiceBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        voiceBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        voiceBtn.heightAnchor.constraint(equalToConstant: 67).isActive = true
        voiceBtn.widthAnchor.constraint(equalToConstant: 67).isActive = true
        
        
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
        replicator.instanceDelay = 0.02

    }

    @objc func actionStartMonitoring(_ sender: AnyObject) {
        dot.backgroundColor = UIColor.green.cgColor
        monitor.startMonitoringWithHandler {level in
            let scaleFactor = max(0.2, CGFloat(level) + 50) / 2
            
            let scale = CABasicAnimation(keyPath: "transform.scale.y")
            scale.fromValue = self.lastTransformScale
            scale.toValue = scaleFactor
            scale.duration = 0.1
            scale.isRemovedOnCompletion = false
            scale.fillMode = kCAFillModeForwards
            self.dot.add(scale, forKey: nil)
            
            self.lastTransformScale = scaleFactor
        }
    }
    
    @objc func actionEndMonitoring(_ sender: AnyObject) {
        monitor.stopMonitoring()
        
        //challenges
        let scale = CABasicAnimation(keyPath: "transform.scale.y")
        scale.fromValue = lastTransformScale
        scale.toValue = 1.0
        scale.duration = 0.2
        scale.isRemovedOnCompletion = false
        scale.fillMode = kCAFillModeForwards
        dot.add(scale, forKey: nil)
        
        dot.backgroundColor = UIColor.magenta.cgColor
        
        let tint = CABasicAnimation(keyPath: "backgroundColor")
        tint.fromValue = UIColor.green.cgColor
        tint.toValue = UIColor.magenta.cgColor
        tint.duration = 1.2
        tint.fillMode = kCAFillModeBackwards
        dot.add(tint, forKey: nil)
    }


}
