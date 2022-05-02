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
    @IBOutlet weak var difficultySlider: UISlider!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var bubbleLabel: UILabel!
    @IBOutlet weak var bubbleSizeLabel: UILabel!
    @IBOutlet weak var difficultyLabel: UILabel!
    
    
    //Save slider/label values based on user selection
    @IBAction func saveSettings(_ sender: UIButton) {
        DataStore.access.bubbleNumber = Int(bubbleSlider.value)
        DataStore.access.timerNumber = Int(timeSlider.value)
        DataStore.access.bubbleSizeNumber = Double(bubbleSizeSlider.value).roundToDecimal(2)
        DataStore.access.difficultyNumber = Int(difficultySlider.value)
    
        updateLabels()
    }
 
    //initialise sliders and labels
    override func viewDidLoad() {
        super.viewDidLoad()
        //Instantiate current settings
        timeSlider.value = Float(DataStore.access.timerNumber)
        bubbleSlider.value = Float(DataStore.access.bubbleNumber)
        bubbleSizeSlider.value = Float(DataStore.access.bubbleSizeNumber)
        updateLabels()
    }
    
    /*
     Update label settings based on stored values
     */
    func updateLabels(){
        timeLabel.text = String(DataStore.access.timerNumber)
        bubbleLabel.text = String(DataStore.access.bubbleNumber)
        bubbleSizeLabel.text = String(DataStore.access.bubbleSizeNumber)
        difficultyLabel.text = String(DataStore.access.difficultyNumber)
    }
    
}
