//
//  ViewController.swift
//  Splish Splash
//
//  Created by Proud Mpala on 7/2/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            self.touchedScreen(touch: touch)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //configure view: allow for multiple touches
        view.isMultipleTouchEnabled = true
    }

    func touchedScreen(touch: UITouch) {
        let touchPoint = touch.location(in: self.view)
        let pulse = Splish(numberOfPulses: 1, radius: 130, position: touchPoint)
        pulse.backgroundColor = randomColor()
        touch.view?.layer.insertSublayer(pulse, above: touch.view?.layer)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            self.makeSplash(touchPoint: touchPoint, splishRadius: 130, view: self.view)
            }
    }
    
    func makeSplash(touchPoint: CGPoint, splishRadius: Float, view: UIView) {
        let maxDistance = Double(100.0)
        let minDistance = Double(60.0)
        let numCircles = Int.random(in: 2...5)
        for _ in 0..<numCircles {

            // generating random value circle center and radius
            var d_x = Double.random(in: 0...maxDistance)
            let decider_x = Double.random(in: 0...1)
            let decider_y = Double.random(in: 0...1)

            if decider_x < 0.5 {
                d_x = -d_x
            }
            
            let minDY = sqrt(abs(minDistance*minDistance - d_x*d_x))
            let maxDY = sqrt(maxDistance*maxDistance - d_x*d_x)
            
            var d_y: Double
            if minDY < maxDY {
                d_y = Double.random(in: minDY...maxDY)
            } else {
                d_y = Double.random(in: maxDY...minDY)
            }
            
            if decider_y < 0.5 {
                d_y = -d_y
            }

            let d_point = CGPoint(x: CGFloat(d_x) + touchPoint.x, y: CGFloat(d_y) + touchPoint.y) //center of the circle
            let radius_scale = Float.random(in: 0.2...0.4)
            let radius = CGFloat(splishRadius * radius_scale)

            let pulse = Splish(numberOfPulses: 1, radius: radius, position: d_point)
            pulse.backgroundColor = randomColor()
            view.layer.insertSublayer(pulse, above: view.layer)

        }
    }

    func randomColor() -> CGColor {
        var floatRandom: CGFloat {
            CGFloat(Float.random(in: 0...1))
        }

        let color = CGColor(red: floatRandom,
                            green: floatRandom,
                            blue: floatRandom,
                            alpha: 1)
        return color

    }
}

