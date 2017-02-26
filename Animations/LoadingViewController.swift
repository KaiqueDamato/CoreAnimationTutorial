//
//  LoadingViewController.swift
//  Animations
//
//  Created by Guest1 on 2/21/17.
//  Copyright © 2017 Guest1. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
    
    var shapeLayer = CAShapeLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bezierPath = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0), radius: 20, startAngle: 0, endAngle: 2 * CGFloat(M_PI), clockwise: true)
        
        shapeLayer.path = bezierPath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.strokeStart = 0
        shapeLayer.strokeEnd = 1
        shapeLayer.position = CGPoint(x: view.center.x, y: view.center.y)
        
        view.layer.addSublayer(shapeLayer)
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [strokeEndAnimation(), strokeStartAnimation(), rotationAnimation()]
        animationGroup.duration = 3
        animationGroup.repeatCount = HUGE
        
        shapeLayer.add(animationGroup, forKey: "stroke")
    }

    func strokeEndAnimation() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.beginTime = 0
        animation.duration = 1.5
        animation.fromValue = 0
        animation.toValue = 1
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        return animation
    }
    
    func strokeStartAnimation() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "strokeStart")
        animation.beginTime = 1.5
        animation.duration = 1.5
        animation.fromValue = 0
        animation.toValue = 1
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        return animation
    }
    
    func rotationAnimation() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.duration = 3
        animation.fromValue = 0
        animation.toValue = 2 * CGFloat(M_PI)
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        return animation
    }
}
