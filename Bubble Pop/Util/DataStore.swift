//
//  DataStore.swift
//  Bubble Pop
//
//  Created by Jacob Elali on 28/4/2022.
//

import Foundation
let BUBBLEKEY = "BUBBLENUMBER"
let TIMERKEY = "TIMERNUMBER"
let BUBBLESIZEKEY = "SIZENUMBER"
let PLAYERKEY = "CURRPLAYER"
let PLAYERARRAYKEY = "ARRAYKEY"
let DIFFICULTYKEY = "DIFFKEY"
let player : Player = Player()


/*
 Serves as a persistent database to store users and settings.
 */
class DataStore{
    
    static let access = DataStore()
    
    /*
     User variables
     */
    var playerName : String = player.name
    {
        didSet {
            UserDefaults.standard.set(playerName, forKey: PLAYERKEY)
        }
    }
    var playerScore : Double = player.score
    {
        didSet {
            UserDefaults.standard.set(playerScore, forKey: PLAYERKEY)
        }
    }
    var playerList : [String : Double] = [:]{
        didSet {
            UserDefaults.standard.set(playerList, forKey: PLAYERARRAYKEY)
        }
    }
    
    /*
     Settings variables
     */
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
    var difficultyNumber : Int = 1 {
        didSet {
            UserDefaults.standard.set(bubbleSizeNumber, forKey: BUBBLESIZEKEY)
        }
    }
    
    private init(){

    }
    
}
