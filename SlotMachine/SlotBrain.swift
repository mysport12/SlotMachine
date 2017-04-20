//
//  SlotBrain.swift
//  SlotMachine
//
//  Created by Craig Martin on 2/11/15.
//  Copyright (c) 2015 MadKitty. All rights reserved.
//

import Foundation

class SlotBrain {

class func organizeSlotsIntoRows(slots: [[Slot]]) -> [[Slot]] {
    var slotRow: [Slot] = []
    var slotRow2: [Slot] = []
    var slotRow3: [Slot] = []
    
    for slotArray in slots {
        for var index = 0; index < slotArray.count; index++ {
            let slot = slotArray[index]
            if index == 0 {
                slotRow.append(slot)
            }
            else if index == 1 {
                slotRow2.append(slot)
            }
            else if index == 2 {
                slotRow3.append(slot)
            }
            else {
                println("error")
            }
        }
    }

    var slotsInRows: [[Slot]] = [slotRow, slotRow2, slotRow3]
    return slotsInRows
}

class func computeWinnings(slots: [[Slot]]) -> Int {
    
    var slotsRows = organizeSlotsIntoRows(slots)
    
    var winnings = 0
    
    var threeOfAKindWinCount = 0
    var flushWinCount = 0
    var straightWinCount = 0
    
    for slotRow in slotsRows {
        if checkFlush(slotRow) == true {
            println("Flush")
            flushWinCount += 1
            winnings += 1
        }
        
        if checkStraight(slotRow) == true {
            println("Straight")
            straightWinCount += 1
            winnings += 1
        }
        if checkThreeOfAKind(slotRow) {
            println("Three of a Kind")
            threeOfAKindWinCount += 1
            winnings += 3
        }
    }
    
    if flushWinCount == 3 {
        println("Royal Flush")
        winnings += 15
    }
    
    if straightWinCount == 3 {
        println("Epic Straight")
        winnings += 1000
    }
    
    if threeOfAKindWinCount == 3 {
        println("Winner Winner Chicken Dinner")
        winnings += 50
    }
    
    return winnings
}
    
    class func checkFlush(slotRow: [Slot]) -> Bool {
        
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.isRed == true && slot2.isRed == true && slot3.isRed == true {
            return true
        }
        else if slot1.isRed == false && slot2.isRed == false && slot3.isRed == false {
            return true
        }
        else {
            return false
        }
    }
    
    class func checkStraight(slotRow: [Slot]) -> Bool {
        
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.value == slot2.value - 1 && slot1.value == slot3.value - 2 {
            return true
        }
        else if slot1.value == slot2.value + 1 && slot1.value == slot3.value + 2 {
            return true
        }
        else {
            return false
        }
    }
    
    class func checkThreeOfAKind(slotRow: [Slot]) -> Bool {
        
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.value == slot2.value && slot1.value == slot3.value {
            return true
        }
        else {
            return false
        }
    }
}