//
//  SettingsController.swift
//  Bubble Pop
//
//  Created by Jacob Elali on 27/4/2022.
//

import UIKit
class SettingsController: UIViewController{
    
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var bubbleSlider: UISlider!
    @IBOutlet weak var bubbleSizeSlider: UISlider!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var bubbleLabel: UILabel!
    @IBOutlet weak var bubbleSizeLabel: UILabel!
    
    @IBAction func saveSettings(_ sender: UIButton) {
        DataStore.access.bubbleNumber = Int(bubbleSlider.value)
        DataStore.access.timerNumber = Int(timeSlider.value)
        DataStore.access.bubbleSizeNumber = Double(round(1000 * bubbleSizeSlider.value) / 1000)
        print(DataStore.access.bubbleSizeNumber)
    }
//    @IBAction func moveTimeSlider(_ sender: UISlider) {
//        timeLabel.text = "\(Int(sender.value))"
//    }
//    @IBAction func moveBubbleSlider(_ sender: UISlider) {
//
//    }
//    @IBAction func moveSizeSlider(_ sender: UISlider) {
//
//    }
//
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "goBackHome" {
//            let VC = segue.destination as! HomeController
//            VC.remainingTime = Int(timeSlider.value)
//            VC.bubbleNumber = Int(bubbleSlider.value)
//            VC.speedNumber = Int(speedSlider.value)
//        }
//
//    }
}
