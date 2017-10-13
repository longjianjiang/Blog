//
//  ViewController.swift
//  VCModalAnimationDemo
//
//  Created by longjianjiang on 2017/10/12.
//  Copyright © 2017年 Jiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var showModalBtn = UIButton(type: .custom)
    let transition = CustomAnimator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.cyan
        
        showModalBtn.translatesAutoresizingMaskIntoConstraints = false
        showModalBtn.setTitle("click to modal", for: .normal)
        showModalBtn.setTitleColor(UIColor.black, for: .normal)
        showModalBtn.addTarget(self, action: #selector(showModalVC), for: .touchDown)
        view.addSubview(showModalBtn)
        showModalBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        showModalBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    @objc func showModalVC() {
        let modalVC = ModalViewController()
        modalVC.transitioningDelegate = self
        present(modalVC, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return transition
    }
}

