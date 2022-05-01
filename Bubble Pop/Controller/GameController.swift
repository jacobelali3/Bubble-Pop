//
//  GameController.swift
//  Bubble Pop
//
//  Created by Jacob Elali on 27/4/2022.
//

import UIKit

class GameController: UIViewController{
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var remainingTimeLabel: UILabel!
    
    var name: String?
    var remainingTime = 60
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
        
        remainingTimeLabel.text = String(remainingTime)
    
        // active timer, and generate bubble each second
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
            timer in
            self.generateBubble()
            self.counting()
        }
        
    }
    @objc func counting() {
        remainingTime -= 1
        remainingTimeLabel.text = String(remainingTime)
        
        if remainingTime == 0 {
            timer.invalidate()
            
            // show HighScore Screen
            let vc = storyboard?.instantiateViewController(identifier: "ScoreView") as! ScoreController
            self.navigationController?.pushViewController(vc, animated: true)
            vc.navigationItem.setHidesBackButton(true, animated: true)
            
            
            
        }
    }
    
    @objc func generateBubble() {
        let bubble = Bubble()
        bubble.animation()
        bubble.addTarget(self, action: #selector(bubblePressed), for: .touchUpInside)
        self.view.addSubview(bubble)
    }
    
    @IBAction func bubblePressed(_ sender: UIButton) {
        // remove pressed bubble from view
        sender.removeFromSuperview()
    }
    
    
}
