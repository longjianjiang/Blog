//
//  ViewController.swift
//  CAShapeLayerAnimationDemo
//
//  Created by longjianjiang on 2017/9/15.
//  Copyright © 2017年 Jiang. All rights reserved.
//

import UIKit
import CoreText

class ViewController: UIViewController {
    
    var animationLayer: CALayer?
    var pathLayer: CAShapeLayer?
    var penLayer: CALayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationLayer = CALayer()
          animationLayer?.frame = CGRect(x: 0.0, y: 20.0, width: self.view.layer.bounds.width, height: self.view.layer.bounds.height - 20.0)
        view.layer.addSublayer(animationLayer!)
        
        setupTextLayer()
        startAnimation()
    }

    func setupTextLayer() {
        clearLayer()
        
        let font = CTFontCreateWithName("PingFangSC-Light" as CFString, 50, nil)
        let attrStr = NSAttributedString(string: "Apple", attributes: [kCTFontAttributeName as String: font])
        let line = CTLineCreateWithAttributedString(attrStr)
        let runArray = CTLineGetGlyphRuns(line)
        
        let letters = CGMutablePath()
        
        for runIndex in 0..<CFArrayGetCount(runArray) {
            let runUnsafe: UnsafeRawPointer = CFArrayGetValueAtIndex(runArray, runIndex)
            let run = unsafeBitCast(runUnsafe, to: CTRun.self)
            
            for runGlyphIndex in 0..<CTRunGetGlyphCount(run) {
                let thisGlyphRange = CFRangeMake(runGlyphIndex, 1)
                var glyph: CGGlyph = CGGlyph()
                var position: CGPoint = CGPoint()
                CTRunGetGlyphs(run, thisGlyphRange, &glyph)
                CTRunGetPositions(run, thisGlyphRange, &position)
                
                let letter = CTFontCreatePathForGlyph(font, glyph, nil)
                let t = CGAffineTransform(translationX: position.x, y: position.y)
                letters.addPath(letter!, transform: t)
            }
            
        }
        
        let path = UIBezierPath()
        path.move(to: CGPoint.zero)
        path.append(UIBezierPath(cgPath: letters))
        
        let layer = CAShapeLayer()
        layer.frame = CGRect(x: 10, y: 120, width: view.layer.bounds.width - 20, height: 100)
        layer.isGeometryFlipped = true
        layer.path = path.cgPath
        layer.strokeColor = UIColor.red.cgColor
        layer.fillColor = nil
        layer.lineWidth = 3.0
        layer.lineJoin = kCALineJoinBevel
        
        animationLayer?.addSublayer(layer)
        pathLayer = layer
        
        setupPenLayer()
    }
    
    func setupPenLayer() {
        let penImage = UIImage(named: "noun_project_347_2")!
        let pensLayer = CALayer()
        pensLayer.contents = penImage.cgImage
        pensLayer.anchorPoint = CGPoint.zero
        pensLayer.frame = CGRect(x: 0.0, y: 0.0, width: penImage.size.width, height: penImage.size.height)
        pathLayer?.addSublayer(pensLayer)
        
        penLayer = pensLayer

    }
    
    func clearLayer() {
        if let _ = pathLayer{
            penLayer?.removeFromSuperlayer()
            pathLayer?.removeFromSuperlayer()
            penLayer = nil
            pathLayer = nil
        }
    }
    
    func startAnimation() {
        penLayer?.removeAllAnimations()
        pathLayer?.removeAllAnimations()
        
        penLayer?.isHidden = false
        
        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.duration = 10.0
        pathAnimation.fromValue = 0.0
        pathAnimation.toValue = 1.0
        pathLayer?.add(pathAnimation, forKey: "strokeEnd")
        
        let penAnimation = CAKeyframeAnimation(keyPath: "position")
        penAnimation.duration = 10.0
        penAnimation.path = pathLayer?.path
        penAnimation.calculationMode = kCAAnimationPaced
        penAnimation.delegate = self
        penLayer?.add(penAnimation, forKey: "position")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        penLayer?.isHidden = true
    }
}
