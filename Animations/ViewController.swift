//
//  ViewController.swift
//  Animations
//
//  Created by Guest1 on 2/21/17.
//  Copyright © 2017 Guest1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func animate(_ sender: Any) {
        animateView {
            self.myView.layer.bounds = CGRect(x: 0, y: 0, width: 300, height: 300)
        }
    }
    
    func animateView(completion: @escaping () -> Swift.Void) {
        let animation = CASpringAnimation(keyPath: "bounds")
        animation.duration = animation.settlingDuration
        animation.damping = 15
        animation.initialVelocity = 0
        animation.fromValue = NSValue(cgRect: myView.layer.bounds)
        animation.toValue = NSValue(cgRect: CGRect(x: 0, y: 0, width: 300, height: 300))
        
        
        CATransaction.begin()
        myView.layer.add(animation, forKey: animation.keyPath)
        CATransaction.setCompletionBlock(completion)
        CATransaction.commit()
    }
}

