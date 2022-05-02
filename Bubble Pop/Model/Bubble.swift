//
//  Bubble.swift
//  Bubble Pop
//
//  Created by Jacob Elali on 27/4/2022.
//

import UIKit

class Bubble: UIButton {
    
    let colourAssigner =  Int.random(in: 1...100)
    var maxxGamePosition: Int = 400
    var maxyGamePosition: Int = 800
    var minxGamePosition: Int = 20
    var minyGamePosition: Int = 20
    var type : Colour = .red
    
    override init(frame: CGRect) {
        
        //initialise
        super.init(frame: frame)
        self.layer.cornerRadius = 0.5 * self.bounds.size.width
        
        //assign colour based on probability
        switch colourAssigner{
        case 1...40: self.type = .red
        case 41...70: self.type = .pink
        case 71...85: self.type = .green
        case 86...95: self.type = .blue
        case 95...100: self.type = .black
        default: self.type = .red
        }
        self.setImage(UIImage(named: type.imageType), for: .normal)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //Handles animation of bubbles
    func animation() {
        let springAnimation = CASpringAnimation(keyPath: "transform.scale")
        springAnimation.duration = 0.6
        springAnimation.fromValue = 0
        springAnimation.toValue = DataStore.access.bubbleSizeNumber
        springAnimation.repeatCount = 1
        springAnimation.initialVelocity = 0.5
        springAnimation.damping = 1
        let xPosition = Int.random(in: self.minxGamePosition...self.maxxGamePosition)
        let yPosition = Int.random(in: self.minyGamePosition...self.maxyGamePosition)
        self.frame = CGRect(x: xPosition, y: yPosition, width: 50, height: 50)
        layer.add(springAnimation, forKey: nil)
    }

    
}
/*
 Defines bubble colour behaviour. Each colour has a point number and image.
 */
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
