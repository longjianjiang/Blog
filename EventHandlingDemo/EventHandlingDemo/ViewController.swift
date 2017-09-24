//
//  ViewController.swift
//  EventHandlingDemo
//
//  Created by longjianjiang on 2017/9/24.
//  Copyright © 2017年 Jiang. All rights reserved.
//

import UIKit

class OrangeView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.orange
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        print("orange view click")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class GreenView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.green
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        print("green view click")
    }
}

class BlueView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.blue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        print("blue view click")
    }
}


class ViewController: UIViewController {

    var orangeView = OrangeView()
    var greenView = GreenView()
    var blueView = BlueView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        /*
         UIControl Action
         ************************************************************
        let btn = UIButton()
        btn.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControlEvents#>)
        // 当点击按钮时，UIApplication通过该方法获取action
        btn.sendActions(for: .touchDown)
        // 然后UIApplication调用该方法，从而可以通知到按钮去执行这个action
        UIApplication.shared.sendAction(<#T##action: Selector##Selector#>, to: <#T##Any?#>, from: <#T##Any?#>, for: <#T##UIEvent?#>)
         ************************************************************
         
         当addTarget，我们传了nil，也就是没有target，此时👆的方法就会通知first responder去执行action,
         如果`first responder`没有实现这个action，那么此时就会根据Responder Chain进行寻找下一个响应者。
        */
        
        
        
        view.addSubview(orangeView)
        view.addSubview(greenView)
        greenView.addSubview(blueView)
        
        orangeView.translatesAutoresizingMaskIntoConstraints = false
        orangeView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        orangeView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        orangeView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        orangeView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        greenView.translatesAutoresizingMaskIntoConstraints = false
        greenView.topAnchor.constraint(equalTo: orangeView.bottomAnchor, constant: 20).isActive = true
        greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        greenView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        greenView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        blueView.translatesAutoresizingMaskIntoConstraints = false
        blueView.topAnchor.constraint(equalTo: greenView.topAnchor, constant: 20).isActive = true
        blueView.leadingAnchor.constraint(equalTo: greenView.leadingAnchor, constant: 40)
        blueView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        blueView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

//    override var next: UIResponder? {
//        return greenView
//    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        print("white view click")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

