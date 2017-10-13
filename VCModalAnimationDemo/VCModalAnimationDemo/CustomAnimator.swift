//
//  CustomAnimator.swift
//  VCModalAnimationDemo
//
//  Created by longjianjiang on 2017/10/12.
//  Copyright © 2017年 Jiang. All rights reserved.
//

import UIKit

func delay(seconds: Double, completion: @escaping ()-> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
}

class CustomAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    let animationDuration = 1.0
    var presenting = true
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return animationDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)
        
        containerView.addSubview(toView!)
        toView?.alpha = 0.0
        
        UIView.animate(withDuration: animationDuration, animations: {
            toView?.alpha = 1.0
        }, completion: { _ in
            transitionContext.completeTransition(true)
        })
        
    }
    
}
