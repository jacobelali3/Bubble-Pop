//
//  Bubble.swift
//  Bubble Pop
//
//  Created by Jacob Elali on 27/4/2022.
//

import UIKit
    

class Bubble: UIButton {
    
    let xPosition = Int.random(in: 20...400)
    let yPosition = Int.random(in: 20...800)
    var type : Colour = .red
    
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setImage(UIImage(named: type.imageType), for: .normal)
        self.frame = CGRect(x: xPosition, y: yPosition, width: 50, height: 50)
        self.layer.cornerRadius = 0.5 * self.bounds.size.width
    }
        
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func animation() {
            let springAnimation = CASpringAnimation(keyPath: "transform.scale")
            springAnimation.duration = 0.6
            springAnimation.fromValue = 1
            springAnimation.toValue = 0.8
            springAnimation.repeatCount = 1
            springAnimation.initialVelocity = 0.5
            springAnimation.damping = 1
            
            layer.add(springAnimation, forKey: nil)
        }
        
        func flash() {
            
            let flash = CABasicAnimation(keyPath: "opacity")
            flash.duration = 0.2
            flash.fromValue = 1
            flash.toValue = 0.1
            flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            flash.autoreverses = true
            flash.repeatCount = 3
            
            layer.add(flash, forKey: nil)
        }
        
    }
enum Colour {
            
    case pink
    case black
    case green
    case blue
    case red
            
var imageType : String {
    switch self {
    case .pink:
        return "pinkBubble"
    case .black:
        return "blackBubble"
    case .green:
        return "greenBubble"
    case .blue:
        return "blueBubble"
    case .red:
        return "redBubble"
    }
}
    var point : Int {
        switch self {
        case .red:
            return 1
        case .pink:
            return 2
        case .green:
            return 5
        case .blue:
            return 8
        case .black:
            return 10
        }
    }
    
}
