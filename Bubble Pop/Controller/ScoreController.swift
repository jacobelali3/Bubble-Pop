//
//  ScoreController.swift
//  Bubble Pop
//
//  Created by Jacob Elali on 27/4/2022.
//

import UIKit
class ScoreController: UIViewController
{
    let sortedPlayerList = DataStore.access.playerList.sorted {
        return $0.value > $1.value
    }
    @IBOutlet weak var scoreViewer: UIView!
    
    
    /*
     Iterate through screen positions, generating labels based on how many users are stored.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let xCoName: Double =  self.scoreViewer.bounds.midX
        var xCoScore: Double = self.scoreViewer.bounds.midX
        xCoScore += 150
        var yCo: Double = self.scoreViewer.bounds.midY
        createLabel(name: "Name:", xCo: xCoName, yCo: yCo)
        createLabel(name: "Score", xCo: xCoScore, yCo: yCo)
        for (key, value) in sortedPlayerList {
            yCo += 30.0
            let playerName = String(key)
            let score = String(value)
            createLabel(name: playerName, xCo: xCoName, yCo: yCo)
            createLabel(name: score, xCo: xCoScore, yCo: yCo)
            
        }
        
    }
    @IBAction func returnMainPage(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }

    /*
     Creates a label for either score or name
     */
    func createLabel(name: String, xCo: Double, yCo: Double)
    {
        let Label = UILabel(frame: CGRect(x: 0, y:0, width: 200, height: 21))
        Label.center = CGPoint(x: xCo, y: yCo)
        Label.text = name
        Label.textAlignment = NSTextAlignment.center
        self.view.addSubview(Label)
    }
}



