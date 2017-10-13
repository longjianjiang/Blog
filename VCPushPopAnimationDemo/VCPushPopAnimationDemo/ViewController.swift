//
//  ViewController.swift
//  VCPushPopAnimationDemo
//
//  Created by longjianjiang on 2017/10/13.
//  Copyright © 2017年 Jiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var logo = LogoLayer.appleLogoLayer()
    var msgLabel = UILabel()
    let transition = CustomAnimator()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.delegate = self
        
        view.backgroundColor = UIColor.gray
        logo.position = view.center
        logo.fillColor = UIColor.white.cgColor
        view.layer.addSublayer(logo)
        
        msgLabel.translatesAutoresizingMaskIntoConstraints = false
        msgLabel.text = "tap screen push"
        msgLabel.textAlignment = .center
        msgLabel.textColor = UIColor.white
        view.addSubview(msgLabel)
        msgLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        msgLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        msgLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        navigationController?.pushViewController(DetailViewController(), animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.operation = operation
        return transition
    }
}

