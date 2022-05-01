//
//  DataStore.swift
//  Bubble Pop
//
//  Created by Jacob Elali on 1/5/2022.
//

import Foundation
let BUBBLEKEY = "BUBBLENUMBER"
let TIMERKEY = "TIMERNUMBER"
let BUBBLESIZEKEY = "SIZENUMBER"
let PLAYERKEY = "CURRPLAYER"
let player : Player = Player()
class DataStore{
    
    static let access = DataStore()
    
    var playerName : String = player.name
    {
        didSet {
            UserDefaults.standard.set(playerName, forKey: PLAYERKEY)
        }
    }
    var playerScore : Int = player.score
    {
        didSet {
            UserDefaults.standard.set(playerScore, forKey: PLAYERKEY)
        }
    }
    var bubbleNumber : Int = 15 {
        didSet {
            UserDefaults.standard.set(bubbleNumber, forKey: BUBBLEKEY)
        }
    }
    var timerNumber : Int = 60 {
        didSet {
            UserDefaults.standard.set(timerNumber, forKey: TIMERKEY)
        }
    }
    var bubbleSizeNumber : Double = 0.8 {
        didSet {
            UserDefaults.standard.set(bubbleSizeNumber, forKey: BUBBLESIZEKEY)
        }
    }
    
    private init(){

    }
    
}
