//
//  HomeController.swift
//  Bubble Pop
//
//  Created by Jacob Elali on 27/4/2022.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    //Set the players name
    @IBAction func saveName(_ sender: UIButton) {
        DataStore.access.playerName = nameTextField.text!
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToGame" {
            let VC = segue.destination as! GameController
            VC.name = DataStore.access.playerName
            VC.remainingTime = DataStore.access.timerNumber
            VC.bubbleCount = DataStore.access.bubbleNumber
        }
    }
    	
    
}
