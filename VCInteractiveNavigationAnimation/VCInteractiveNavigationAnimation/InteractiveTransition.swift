//
//  InteractiveTransition.swift
//  VCInteractiveNavigationAnimation
//
//  Created by longjianjiang on 2017/10/13.
//  Copyright © 2017年 Jiang. All rights reserved.
//

import UIKit

class InteractiveTransition: UIPercentDrivenInteractiveTransition {
    var navigationController: UINavigationController!
    var transitionInProgress = false
    
    func attachToViewController(viewController: UIViewController) {
        navigationController = viewController.navigationController
        setupGestureRecognizer(view: viewController.view)
    }
    
    private func setupGestureRecognizer(view: UIView) {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(recognizer:)))
        
        view.addGestureRecognizer(pan)
    }
    
    @objc func handlePanGesture(recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: recognizer.view?.superview) // nivigation's view
        var progress: CGFloat = abs(translation.x / 200.0)
        progress = min(max(progress, 0.01), 0.99)
        
        switch recognizer.state {
        case .began:
           transitionInProgress = true
           navigationController.popViewController(animated: true)
        case .changed:
            update(progress)
        case .cancelled, .ended:
            if progress < 0.5 {
                cancel()
            } else {
                finish()
            }
            transitionInProgress = false
        default:
            break
        }
    }

}
