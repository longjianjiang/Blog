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

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print("enter orange view")
        let view = super.hitTest(point, with: event)
        print("leave orange view")
        print("=========================================")
        return view
    }

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        print("judge point inside orange view")
        let isInside = super.point(inside: point, with: event)
        print("point is inside orange view \(isInside)")
        return isInside
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

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print("enter green view")
        let view = super.hitTest(point, with: event)
        print("leave green view")
        print("=========================================")
        return view
    }

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        print("judge point inside green view")
        let isInside = super.point(inside: point, with: event)
        print("point is inside green view \(isInside)")
        return isInside
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

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print("enter blue view")
        let view = super.hitTest(point, with: event)
        print("leave blue view")
        print("=========================================")
        return view
    }

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        print("judge point inside blue view")
        let isInside = super.point(inside: point, with: event)
        print("point is inside blue view \(isInside)")
        return isInside
    }
}

class PurpleView: UIView {
    var targetView: UIView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.purple
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// touch purple view will pass touch event to orange view
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        print("purple view click")
    }

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print("enter purple view")
        let view = super.hitTest(point, with: event)
        print("leave purple view")
        print("=========================================")
        return targetView
    }

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        print("judge point inside purple view")
        let isInside = super.point(inside: point, with: event)
        print("point is inside purple view \(isInside)")
        return isInside
    }
}


class ViewController: UIViewController {

    var orangeView = OrangeView()
    var greenView = GreenView()
    var blueView = BlueView()
    var purpleView = PurpleView()
    
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
        
        
        purpleView.targetView = orangeView

        view.addSubview(orangeView)
        view.addSubview(greenView)
        greenView.addSubview(blueView)
        greenView.addSubview(purpleView)

        let guide = view.safeAreaLayoutGuide

        orangeView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orangeView.topAnchor.constraint(equalTo: guide.topAnchor),
            orangeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            orangeView.widthAnchor.constraint(equalToConstant: 100),
            orangeView.heightAnchor.constraint(equalToConstant: 100)
        ])

        greenView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            greenView.topAnchor.constraint(equalTo: orangeView.bottomAnchor, constant: 20),
            greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            greenView.widthAnchor.constraint(equalToConstant: 200),
            greenView.heightAnchor.constraint(equalToConstant: 100)
        ])

        blueView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            blueView.topAnchor.constraint(equalTo: greenView.topAnchor, constant: 20),
            blueView.leadingAnchor.constraint(equalTo: greenView.leadingAnchor, constant: 40),
            blueView.widthAnchor.constraint(equalToConstant: 50),
            blueView.heightAnchor.constraint(equalToConstant: 50)
        ])

        purpleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            purpleView.topAnchor.constraint(equalTo: greenView.topAnchor, constant: 20),
            purpleView.trailingAnchor.constraint(equalTo: greenView.trailingAnchor, constant: -40),
            purpleView.widthAnchor.constraint(equalToConstant: 50),
            purpleView.heightAnchor.constraint(equalToConstant: 50)
        ])

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

