//
//  Habit+CoreDataClass.swift
//  Habit
//
//  Created by Yingfan Chen on 9/21/19.
//  Copyright © 2019 Kyle Lee. All rights reserved.
//
//

import UIKit
import Foundation
import CoreData

@objc(Habit)
public class Habit: NSManagedObject {
    
    var id: String!
    var birthday: Date!
    var lastClockedIn: Date!
    var image: UIImage!
    var healthXP = 100.0
    var healthXPperSecond = 100.0 / 604800.0
    var mood = "happy"
    var level = 1
    var exp = 0.0
    var maxExp = 100.0
    
    func changeName(name: String){
        self.name = name
    }
    
    func updateHealth(){
        var timeAfterLastClockedIn = DateInterval(start: lastClockedIn, end: Date())
        let duration = timeAfterLastClockedIn.duration
        if healthXP >= 0 {
            self.healthXPperSecond -= (healthXPperSecond * duration)
        }
        else {
            healthXP = 0
        }
    }
    
    func updateMood(){
        if self.healthXP > 80 {
            self.mood = "Happy"
        }
        else if self.healthXP > 60 {
            self.mood = "Indifferent"
        }
        else if self.healthXP > 40 {
            self.mood = "Moody"
        }
        else if self.healthXP > 20 {
            self.mood = "I MIGHT EXPLODE"
        }
        else{
            self.mood = "I AM DYING"
        }
    }
    
    func updateLevel(){
        self.exp += 20
        if level == 10 && self.exp + 10 > 100{
            self.exp = 100
        }
        
        if level < 10 && exp > maxExp {
            exp -= maxExp
            level += 1
            maxExp += 100
        }
    }
    
    func updateClockedIn(){
        self.lastClockedIn = Date()
        
        if healthXP + 23 <= 100{
            self.healthXP += 23
        }
        else{
            self.healthXP = 100
        }
        
        updateLevel()
    }
}
