//
//  InteractiveAnimator.swift
//  VCInteractiveNavigationAnimation
//
//  Created by longjianjiang on 2017/10/13.
//  Copyright © 2017年 Jiang. All rights reserved.
//

import UIKit

class InteractiveAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    let animationDuration = 2.0
    var interactive = false
    
    var reverse: Bool = false
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return animationDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let toVC = transitionContext.viewController(forKey: .to)!
        let fromVC = transitionContext.viewController(forKey: .from)!
        let toView = toVC.view!
        let fromView = fromVC.view!
        
        let direction: CGFloat = reverse ? -1 : 1
        let const: CGFloat = -0.005
        
        toView.layer.anchorPoint = CGPoint(x: direction == 1 ? 0 : 1, y: 0.5)
        fromView.layer.anchorPoint = CGPoint(x: direction == 1 ? 1 : 0, y: 0.5)
        
        var viewFromTransform = CATransform3DMakeRotation(direction * .pi/2, 0.0, 1.0, 0.0)
        var viewToTransform = CATransform3DMakeRotation(-direction * .pi/2, 0.0, 1.0, 0.0)
        viewFromTransform.m34 = const
        viewToTransform.m34 = const
        
        containerView.transform = CGAffineTransform(translationX: direction * containerView.frame.width / 2.0, y: 0)
        toView.layer.transform = viewToTransform
        containerView.addSubview(toView)
        
        
        UIView.animate(withDuration: animationDuration, animations: {
            containerView.transform = CGAffineTransform(translationX: -direction * containerView.frame.width / 2.0, y: 0)
            fromView.layer.transform = viewFromTransform
            toView.layer.transform = CATransform3DIdentity
        }, completion: { _ in
            containerView.transform = CGAffineTransform.identity
            fromView.layer.transform = CATransform3DIdentity
            toView.layer.transform = CATransform3DIdentity
            fromView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            toView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
    
}
