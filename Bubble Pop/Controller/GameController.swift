//
//  GameController.swift
//  Bubble Pop
//
//  Created by Jacob Elali on 27/4/2022.
//

import UIKit
var scoreCounter: Int = 0

class GameController: UIViewController{
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var remainingTimeLabel: UILabel!
    @IBOutlet weak var scoreCount: UILabel!
    @IBOutlet weak var comboNotif: UILabel!
    @IBOutlet weak var highestScore: UILabel!
    @IBOutlet weak var gameView: UIView!
  

    
    var name: String?
    var remainingTime = 60
    var bubbleCount: Int = 15
    var timer = Timer()
    var scoreCounter: Double = 0.0
    var combo: Int = 0
    let maximum = DataStore.access.playerList.reduce(0.0) { max($0, $1.1) }
    
    
    /*
     Initiates all settings for game.
     Generates/removes bubbles based on timer.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        bubbleCount = DataStore.access.bubbleNumber
        nameLabel.text = name
        remainingTimeLabel.text = String(remainingTime)
        highestScore.text = String(maximum)
        self.comboNotif.text = ""
        
        // active timer, and generate bubbles! (difficulty is thrown in here)
        var countTime: Int = 0
        let difficulty: Int = self.decideDifficulty(time: DataStore.access.difficultyNumber)
        timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(difficulty), repeats: true) {
            timer in
            self.counting()
            self.setBubbles(bubbleCount: self.bubbleCount)
            countTime += 1
            if countTime % 2 == 0 {
                for view in self.gameView.subviews{
                        view.removeFromSuperview()
                }
            }
            
        }
        
    }
    //This function converts 1-5 to 5-1 as time/difficulty scales oppositely
    func decideDifficulty(time: Int) ->Int{
        switch time{
        case 5:
            return 1
        case 4:
            return 2
        case 3:
            return 3
        case 2:
            return 4
        case 1:
            return 5
        default:
            return 1
        }
    }
    //Generates bubbles based on bubble count
    func setBubbles(bubbleCount: Int){
        for _ in 1...bubbleCount
        {
            self.generateBubble()
        }
        
    }
    
    //Handles time functionality
    @objc func counting() {
        remainingTime -= 1
        remainingTimeLabel.text = String(remainingTime)
        
        if remainingTime == 0 {
            timer.invalidate()
            DataStore.access.playerScore = scoreCounter
            DataStore.access.playerList[self.name!] = scoreCounter
        
            // show HighScore Screen
            let vc = storyboard?.instantiateViewController(identifier: "ScoreController") as! ScoreController
            self.navigationController?.pushViewController(vc, animated: true)
            vc.navigationItem.setHidesBackButton(true, animated: true)
            
            
            
        }
    }
    
    //Generates a single bubble
    @objc func generateBubble() {
        let bubble = Bubble()
        
        //restrain bubble position within game view
        bubble.minxGamePosition = Int(self.gameView.bounds.minX)
        bubble.minyGamePosition = Int(self.gameView.bounds.minX)
        bubble.maxxGamePosition = Int(self.gameView.bounds.maxX)
        bubble.maxyGamePosition = Int(self.gameView.bounds.maxY)
        bubble.animation()
        bubble.tag = bubble.type.point
        bubble.addTarget(self, action: #selector(bubblePressed), for: .touchUpInside)
       
        self.gameView.addSubview(bubble)
        
    }
    
    /*
     Defines core functionality when 'popping' bubble, including combo multiplier.
     */
    @IBAction func bubblePressed(_ sender: UIButton) {
        // remove pressed bubble from view
        scoreCount.text = String(scoreCounter)
        self.comboNotif.text = ""
        if self.combo == sender.tag
        {
            self.comboNotif.text = "COMBO! x1.5"
            self.scoreCounter += (1.5 * Double(sender.tag))
        }
        else
        {
            self.scoreCounter += Double(sender.tag)
        }
        print(String(self.scoreCounter))
        self.combo = sender.tag
        sender.removeFromSuperview()
        
    }
  
    
    
    
}
