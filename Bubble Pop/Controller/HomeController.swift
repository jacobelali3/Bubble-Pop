//
//  HomeController.swift
//  Bubble Pop
//
//  Created by Jacob Elali on 27/4/2022.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
   // var user: User
    var remainingTime: Int = 60
    var bubbleNumber: Int = 0
    var speedNumber: Int = 0
    
    @IBAction func playButton(_ sender: UIButton) {
        for chr in nameTextField.text! {
            if ((chr >= "a" && chr <= "z") && (chr >= "A" && chr <= "Z") ) {
                DataStore.access.playerName = nameTextField.text!
            }
         }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToGame" {
            let VC = segue.destination as! GameController
            VC.name = DataStore.access.playerName
            VC.remainingTime = DataStore.access.timerNumber
        }
    }
    	
    
}
