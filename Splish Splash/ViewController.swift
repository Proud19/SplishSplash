//
//  ViewController.swift
//  Splish Splash
//
//  Created by Proud Mpala on 7/2/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(touchedScreen(touch:)))
            view.addGestureRecognizer(tap)
    }
    
    
    @objc func touchedScreen(touch: UITapGestureRecognizer) {
        let touchPoint = touch.location(in: self.view)
        let pulse = Splish(numberOfPulses: 1, radius: 130, position: touchPoint)
        pulse.animationDuration = 2
        pulse.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        touch.view?.layer.insertSublayer(pulse, above: touch.view?.layer)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            self.makeSplash(touchPoint: touchPoint, splishRadius: 130, view: touch.view!)
            }
        
    }
    
    func makeSplash(touchPoint: CGPoint, splishRadius: Float, view: UIView) {
        let maxDistance = Float(100.0)
        let minDistance = Float(60.0)
        let numCircles = Int.random(in: 2...5)
        for _ in 0..<numCircles {
            var d_x = CGFloat(Float.random(in: minDistance...maxDistance))
            var d_y = CGFloat(Float.random(in: minDistance...maxDistance))
            let decider_x = Float.random(in: 0...1)
            
            if decider_x < 0.5 {
                d_x = -d_x
            }
            let decider_y = Float.random(in: 0...1)
            if decider_y < 0.5 {
                d_y = -d_y
            }
            
            let d_point = CGPoint(x: d_x + touchPoint.x, y: d_y + touchPoint.y)
            print(touchPoint)
            let radius_scale = Float.random(in: 0.2...0.4)
            let radius = CGFloat(splishRadius * radius_scale)
            
            let pulse = Splish(numberOfPulses: 1, radius: radius, position: d_point)
            pulse.animationDuration = 2
            pulse.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
            view.layer.insertSublayer(pulse, above: view.layer)
           
        }
    }
}

