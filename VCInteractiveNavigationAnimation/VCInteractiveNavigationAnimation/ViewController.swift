//
//  ViewController.swift
//  VCInteractiveNavigationAnimation
//
//  Created by longjianjiang on 2017/10/13.
//  Copyright © 2017年 Jiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let animator = InteractiveAnimator()
    let transition = InteractiveTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        navigationController?.delegate = self
        view.backgroundColor = UIColor.gray
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       navigationController?.pushViewController(DetailViewController(), animated: true)
    }

}


extension ViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
           transition.attachToViewController(viewController: toVC)
        }
        animator.reverse = operation == .pop
        
        return animator
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return transition.transitionInProgress ? transition : nil
    }
    
}
